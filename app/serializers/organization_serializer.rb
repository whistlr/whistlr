class OrganizationSerializer < ActiveModel::Serializer
  embed :ids, include: true
  
  attributes :id, :type, :following, :approved, :declined, :pending, :city, :country, :facebook_alias, :facebook_id, :name, :region, :twitter_alias, :website
  has_one :upload
  has_one :parent, root: :organizations
  has_many :children, root: :organizations

  def following
    current_user.following(object) if current_user.present?
  end

end
