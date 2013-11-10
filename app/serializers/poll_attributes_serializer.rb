class PollAttributesSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :pollable, :pollableType, :approved, :declined, :pending, :votes_yea, :votes_nay, :votes_sum, :notes, :voted_for
  has_one :user

  def pollable
    object.pollable_id
  end

  def pollableType
    object.pollable_type.gsub("::", "")
  end

  def voted_for
    current_user.vote_for(object.pollable) if current_user.present?
  end
end
