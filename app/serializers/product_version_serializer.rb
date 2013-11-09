class ProductVersionSerializer < ActiveModel::Serializer
  root :product
  embed :ids, include: true
  
  attributes :id, :type, :approved, :declined, :pending, :facebook_alias, :facebook_id, :name, :twitter_alias, :website
  has_one :upload
  has_one :organization

  has_one :user
  has_one :master, root: :products
  has_one :version_attributes
  has_one :poll_attributes
end
