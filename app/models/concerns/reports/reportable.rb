module Reports::Reportable
  extend ActiveSupport::Concern

  included do
    has_one :reportable_attributes, as: :reportable
    has_many :report_participants, as: :reportable, class_name: "Report::Participant"
    has_many :reports, through: :report_participants
    has_many :approved_reports, -> { where "reports.approved = true" }, source: :reports,
      through: :report_participants, class_name: "Report::Master"

    after_create :create_reportable_attributes
  end

  def collective_opinion
    report_participants.to_a.sum do |participant|
      participant.master_report.try(:approved?) ? participant.master_report.responses.sum("value * (#{participant.involvement} * #{participant.involvement})") : 0
    end
  end

  def update_reportable_attributes
    reportable_attributes.tally_attributes
  end


end
