class OfficialVersionSerializer < ActiveModel::Serializer
  root :official
  embed :ids, include: true
  
  attributes :id, :type, :slug, :approved, :declined, :pending, :facebook_alias, :facebook_id, :name, :twitter_alias, :website
  has_one :upload

  has_one :master, root: :officials
  has_one :version_attributes
  has_one :poll_attributes
end
