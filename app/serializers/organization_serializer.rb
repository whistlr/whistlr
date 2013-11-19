class OrganizationSerializer < ActiveModel::Serializer
  embed :ids, include: true
  
  attributes :id, :type, :following, :approved, :declined, :pending, :city, :country, :facebook_alias, :facebook_id, :name, :region, :twitter_alias, :website, :parent_id, :children_ids
  has_one :upload

  def children_ids
    object.children.collect{|child| child.id}
  end

  def following
    current_user.following(object) if current_user.present?
  end

end
