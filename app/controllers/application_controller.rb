class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user_from_token!

  rescue_from ActionView::MissingTemplate do |exception|
    render "/layouts/application"
  end

  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in?
      render json: {errors: {base: I18n.t("errors.shared.you_lack_permission")}}, status: :unprocessable_entity
    else
      render json: {errors: {base: I18n.t("errors.shared.must_be_signed_in")}}, status: :unprocessable_entity
    end
  end

 private
  
  def authenticate_user_from_token!
    user_token = params[:auth_token].presence
    user       = user_token && User.find_by_authentication_token(user_token)

    if user
      sign_in user, store: false
    end
  end
end
