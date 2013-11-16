class FollowsController < ApplicationController

  def create
    authorize! :authenticate, Follow
    follow = Follow.create_following(follow_params)
    render json: follow
  end

private

  def follow_params
    params.require(:follow).permit(:followable_type, :followable_id).merge(user: current_user)
  end
end
