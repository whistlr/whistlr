class ReportSerializer < ActiveModel::Serializer
  embed :ids, include: true
  
  attributes  :id, :type, :approved, :declined, :pending, :description, :summary, :responded_to, :responses_approve, :responses_disapprove, :controversy, :disinterest

  has_many :participants, root: :report_participants
  has_many :evidence, root: :report_evidence
  
  def responded_to
    current_user.response_for(object) if current_user.present?
  end
end
