class Report::Response < ActiveRecord::Base

  belongs_to :report
  belongs_to :user

  validates_presence_of :user, :report

  after_destroy :sum_responses, :adjust_reportable_stats
  after_save :sum_responses, :adjust_reportable_stats

  def self.create_update_or_destroy_response(response, value)
    if response.new_record?
      response.save
    elsif response.value == value.to_i
      response.destroy
    else
      response.update_attribute(:value, value)
    end
    return response
  end

  def sum_responses
    positive = report.responses.where("value > 0").count
    negative = report.responses.where("value < 0").count
    if positive > 0 && negative > 0
      controversy = positive > negative ? negative/positive : positive/negative
      controversy = controversy * 100000
      total = positive + negative
      controversy = controversy * (total/100) if total < 100
    else
      controversy = 0
    end
    report.update_columns(controversy: controversy, responses_approve: positive,
      responses_disapprove: negative, responses_sum: report.responses.sum(:value))
  end

  def adjust_reportable_stats
    report.participants.each do |participant|
      participant.reportable.reportable_attributes.update_columns(
        controversy: participant.reportable.approved_reports.sum(:controversy),
        favor: participant.reportable.collective_opinion)
    end
  end

end
