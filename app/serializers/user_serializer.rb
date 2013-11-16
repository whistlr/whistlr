class UserSerializer < ActiveModel::Serializer
  attributes :name, :id, :following, :archivist_reputation, :whistlr_reputation

  def following
    current_user.following(object) if current_user.present?
  end
end
