class ProductSerializer < ActiveModel::Serializer
  embed :ids, include: true
  
  attributes :id, :type, :approved, :declined, :pending, :facebook_alias, :facebook_id, :name, :twitter_alias, :website
  has_one :upload
  has_one :organization
end
