class VoteableSerializer < ActiveModel::Serializer
  
  attributes :id, :voted_for, :votes_nay, :votes_sum, :votes_yea, :voteableType, :voteableId

  def voteableType
    object.pollable_type
  end

  def voteableId
    object.pollable_id
  end

  def voted_for
    current_user.vote_for(object.pollable)
  end
end
