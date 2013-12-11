class OrganizationVersionSerializer < ActiveModel::Serializer
  root :organization
  embed :ids, include: true
  
  attributes :id, :type, :slug, :approved, :declined, :pending, :city, :country, :facebook_alias, :facebook_id, :name, :region, :twitter_alias, :website, :parent_id
  has_one :upload

  def children_ids
    object.children.collect{|child| child.id}
  end

  has_one :master, root: :organizations
  has_one :version_attributes
  has_one :poll_attributes
end
