class ReportResponseSerializer < ActiveModel::Serializer
  
  attributes :responded_to, :responses_approve, :responses_disapprove, :controversy, :disinterest, :id

  def responded_to
    current_user.response_for(object)
  end
end
