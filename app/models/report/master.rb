class Report::Master < Report
  include Events::Timelineable
  include Versions::Versionable
  include Follows::Followable
  
  validates :participant_joins, presence: true
  validates :evidence_joins, presence: true

  after_update :adjust_reportable_stats

  def active_model_serializer
    ReportSerializer
  end

private

  def adjust_reportable_stats
    participants.each do |participant|
      approved_reports_count = participant.reportable.approved_reports.count
      reportable_controversy = approved_reports_count > 0 ? participant.reportable.approved_reports.sum(:controversy)/approved_reports_count : 0
      participant.reportable.reportable_attributes.update_columns(
        controversy: reportable_controversy,
        favor: participant.reportable.collective_opinion,
        report_count: participant.reportable.approved_reports.count)
    end
  end

end
