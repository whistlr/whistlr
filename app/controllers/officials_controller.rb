class OfficialsController < ApplicationController
  include Query::Params

  respond_to :json, :html

  def index
    params[:page] ||= 0
    params[:per_page] ||= 25
    officials = Official::Master.where(query_params(Official)).offset(params[:page].to_i * params[:per_page].to_i).limit(params[:per_page].to_i)
    respond_with officials
  end

  def show
    official = Official.friendly.find(params[:id])
    respond_with official
  end

  def new
    respond_with nil
  end

  def create
    official = Official::Master.new(official_params)
    authorize! :create, official
    official.save
    respond_with official, location: root_path
  end

  def edit
  end

  def update
    official = Official::Master.friendly.find(params[:id])
    authorize! :update, official
    version = official.create_version(official_params)
    respond_with version
  end

private

  def official_params
    params.require(:official).permit(:name, :upload_id,
      :facebook_alias, :twitter_alias, :website, :notes).
      merge(user: current_user)
  end

end