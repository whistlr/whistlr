class OfficialSerializer < ActiveModel::Serializer
  embed :ids, include: true
  
  attributes :id, :type, :slug, :following, :approved, :declined, :pending, :bio, :facebook_alias, :facebook_id, :name, :twitter_alias, :website
  has_one :upload

  def following
    current_user.following(object) if current_user.present?
  end

end
