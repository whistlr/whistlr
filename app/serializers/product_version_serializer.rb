class ProductVersionSerializer < ActiveModel::Serializer
  root :product
  embed :ids, include: true
  
  attributes :id, :type, :slug, :approved, :declined, :pending, :facebook_alias, :facebook_id, :name, :twitter_alias, :website, :organization_id
  has_one :upload
  has_many :eans, root: :product_eans

  has_one :master, root: :products
  has_one :version_attributes
  has_one :poll_attributes
end
