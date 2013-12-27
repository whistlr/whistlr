class ProductSerializer < ActiveModel::Serializer
  embed :ids, include: true
  
  attributes :id, :type, :slug, :following, :approved, :declined, :pending, :facebook_alias, :facebook_id, :name, :twitter_alias, :website, :organization_id

  has_one :upload
  has_many :eans, root: :product_eans

  def following
    current_user.following(object) if current_user.present?
  end
end
