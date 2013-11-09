class OfficialSerializer < ActiveModel::Serializer
  embed :ids, include: true
  
  attributes :id, :type, :approved, :declined, :pending, :bio, :facebook_alias, :facebook_id, :name, :twitter_alias, :website
  has_one :upload

end
