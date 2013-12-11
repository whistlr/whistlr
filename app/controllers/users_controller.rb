class UsersController < ApplicationController
  respond_to :json, :html

  def create
    user = User.new(user_params)
    authorize! :create, user
    if user.save
      render nothing: true, status: 204
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def show
    respond_with User.friendly.find(params[:id])
  end

private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end

end