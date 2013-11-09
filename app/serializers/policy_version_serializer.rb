class PolicyVersionSerializer < ActiveModel::Serializer
  root :policy
  embed :ids, include: true
  
  attributes :id, :type, :approved, :declined, :pending, :name
  has_one :upload
  has_one :organization

  has_one :user
  has_one :master, root: :policies
  has_one :version_attributes
  has_one :poll_attributes

end
