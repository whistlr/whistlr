class PolicySerializer < ActiveModel::Serializer
  embed :ids, include: true
  
  attributes :id, :type, :approved, :declined, :pending, :name
  has_one :upload
  has_one :organization

end
