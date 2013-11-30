class ReportsController < ApplicationController
  include Query::Params

  respond_to :json, :html

  def index
    params[:page] ||= 0
    params[:per_page] ||= 25
    if params[:reportable_type]
      reportable = params[:reportable_type].constantize.friendly.find params[:reportable_id]
    else
      if klass = ["official", "organization", "product"].detect { |pk| request.original_url.include? pk }
        reportable = klass.camelize.constantize.friendly.find params[:id]
      end
    end
    reports = reportable.approved_reports.where(query_params(Report)).offset(params[:page].to_i * params[:per_page].to_i).limit(params[:per_page].to_i)
    respond_with reports
  end

  def show
    respond_with Report.friendly.find params[:id]
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
  end

  def update
    report = Report.friendly.find(params[:id])
    authorize! :update, report
    version = report.update_with_nested_models(primary_model_params, nested_model_params)
    respond_with version
  end

private

  def report_attr
    [:summary, :description, :notes]
  end

  def participant_attr
    [:_destroy, :involvement, :summary, :reportable_id, :reportable_type, :id]
  end

  def evidence_attr
    [:_destroy, :citation, :url, :id]
  end

  def report_params
    joined_params.require(:report).permit(report_attr, participant_joins_attributes: [ participant_attributes: participant_attr ], evidence_joins_attributes: [ evidence_attributes: evidence_attr ]).merge(user: current_user)
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

  def primary_model_params
    params.require(:report).permit(report_attr).merge(user: current_user)
  end

  def nested_model_params
    params.require(:report).permit([[participants_attributes: participant_attr]+[evidence_attributes: evidence_attr]])
  end

end
