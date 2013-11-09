class OrganizationVersionSerializer < ActiveModel::Serializer
  root :organization
  embed :ids, include: true
  
  attributes :id, :type, :approved, :declined, :pending, :city, :country, :facebook_alias, :facebook_id, :name, :region, :twitter_alias, :website
  has_one :upload
  has_one :user
  has_one :parent, root: :organizations
  has_many :children, root: :organizations

  has_one :master, root: :organizations
  has_one :version_attributes
  has_one :poll_attributes
end
