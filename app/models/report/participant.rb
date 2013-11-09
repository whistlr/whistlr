class Report::Participant < ActiveRecord::Base
  strip_attributes

  attr_accessor :_destroy

  belongs_to :reportable, polymorphic: true
  has_many :reports, through: :report_joins
  has_many :report_joins, class_name: "Report::Participant::Join"

  belongs_to :previous, class_name: "Report::Participant"
  has_one :next, class_name: "Report::Participant", foreign_key: :previous_id

  def master_report
    reports.find_by(type: "Report::Master")
  end

  def active_model_serializer
    ReportParticipantSerializer
  end

  def reportable_id=(id)
    if id.present?
      @reportable_id = id
    else
      @reportable_id = reportable_with_name
    end
    super
  end

  def reportable_name=(name)
    @reportable_name = name
  end

  def reportable_name
    @reportable_name || reportable.try(:name)
  end

  def name
    summary || report.summary
  end

private

  def adjust_reportable_stats
    reportable.update_reportable_attributes if master_report.approved?
  end

  def reportable_with_name
    reportable_type.constantize.where(name: @reportable_name).first_or_create(user: @user).id
  end

  def adjust_reports_count
    reportable.reportable_attributes.update_column(:report_count, reportable.approved_reports.count)
  end

end
