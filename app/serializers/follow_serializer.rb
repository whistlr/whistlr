class FollowSerializer < ActiveModel::Serializer
  
  attributes :following

  def following
    current_user.following(object.followable) if current_user.present?
  end
end
