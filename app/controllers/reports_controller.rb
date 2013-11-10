class ReportsController < ApplicationController
  include Query::Params

  before_action :set_report, only: [:show, :edit, :update]
  respond_to :json, :html

  def index
    params[:page] ||= 0
    params[:per_page] ||= 25
    if params[:reportable_type]
      reportable = params[:reportable_type].constantize.find params[:reportable_id]
    else
      if klass = ["official", "organization", "policy", "product"].detect { |pk| request.original_url.include? pk }
        reportable = klass.camelize.constantize.find params[:id]
      end
    end
    reports = reportable.approved_reports.where(query_params(Report)).offset(params[:page].to_i * params[:per_page].to_i).limit(params[:per_page].to_i)
    respond_with reports
  end

  def show
    respond_with Report.find params[:id]
  end

  def new
    report = Report::Master.new
    respond_with report
  end

  def create
    report = Report::Master.new(report_params)
    authorize! :create, report
    report.save
    respond_with report, location: root_path
  end

  def edit
    authorize! :update, report
    report.participants.build if report.participants.blank?
    report.evidence.build if report.evidence.blank?
    report.versions.new
    respond_with(version, responder: TransitionResponder)
  end

  def update
    authorize! :update, report
    if report.update_with_nested_models(report_params, nested_model_params)
      redirect_to report, notice: t('report.versions.create.revision_submitted')
    else
      update_transition_responder
    end
  end

private
  def set_report
    report = Report.find(params[:id])
  end

  def report_attr
    [:summary, :description]
  end

  def participant_attr
    [:_destroy, :involvement, :summary, :reportable_id, :reportable_type]
  end

  def evidence_attr
    [:_destroy, :citation, :url, :upload_id]
  end

  def report_and_nested_model_params
    filtered_params = params.require(:report).permit([report_attr + [participants_attributes: participant_attr]+[evidence_attributes: evidence_attr]])
    additional_params = {user: current_user, participants_attributes: [user: current_user, approved: true, pending: false, submitted_with_report: true], evidence_attributes: [user: current_user, approved: true, pending: false, submitted_with_report: true]}
    result = filtered_params.merge(additional_params) do |key, oldval, newval|
      if newval.is_a? Array
        oldval ||= {}
        oldval.map {|key| key.merge(newval.first)}
      elsif newval.is_a? Hash
        oldval ||= {}
        oldval.merge newval
      else
        newval
      end
    end
    result.permit!
  end

  def report_params
    joined_params.require(:report).permit(:summary, :description, participant_joins_attributes: [ participant_attributes: [:_destroy, :involvement, :summary, :reportable_id, :reportable_type] ], evidence_joins_attributes: [ evidence_attributes: [:_destroy, :citation, :url, :upload_id ] ]).merge(user: current_user)
  end

  def joined_params
    vetted_params = params.dup
    participants = vetted_params[:report].extract!(:participants_attributes)
    evidence = vetted_params[:report].extract!(:evidence_attributes)
    if participants[:participants_attributes].present?
      vetted_params[:report].merge!(participant_joins_attributes: [])
      participants[:participants_attributes].each do |participant|
        vetted_params[:report][:participant_joins_attributes] << {participant_attributes: participant}
      end
    end
    if evidence[:evidence_attributes].present?
      vetted_params[:report].merge!(evidence_joins_attributes: [])
      evidence[:evidence_attributes].each do |evidence|
        vetted_params[:report][:evidence_joins_attributes] << {evidence_attributes: evidence}
      end
    end
    vetted_params
  end

  def nested_model_params
    filtered_params = params.require(:report).permit([[participants_attributes: participant_attr]+[evidence_attributes: evidence_attr]])
    additional_params = {participants_attributes: [user: current_user], evidence_attributes: [user: current_user]}
    result = filtered_params.merge(additional_params) do |key, oldval, newval|
      if newval.is_a? Array
        oldval ||= {}
        Hash[oldval.map {|k, v| [k, v.merge(newval.first)]}]
      elsif newval.is_a? Hash
        oldval ||= {}
        oldval.merge newval
      else
        newval
      end
    end
    result.permit!
  end

end
