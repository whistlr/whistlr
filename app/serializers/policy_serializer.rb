class PolicySerializer < ActiveModel::Serializer
  embed :ids, include: true
  
  attributes :id, :type, :following, :approved, :declined, :pending, :name
  has_one :upload
  has_one :organization

  def following
    current_user.following(object) if current_user.present?
  end

end
