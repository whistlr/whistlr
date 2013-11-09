class ReportableAttributes < ActiveRecord::Base
  belongs_to :reportable, polymorphic: true

  def tally_attributes
    update_attriubtes(controversy: reportable.reports.sum(:controversy)/reportable.reports.count, favor: reportable.collective_opinion)
  end

end