class OrganizationsController < ApplicationController
  include Query::Params

  respond_to :json, :html

  def index
    params[:page] ||= 0
    params[:per_page] ||= 25
    organizations = Organization::Master.where(query_params(Organization)).offset(params[:page].to_i * params[:per_page].to_i).limit(params[:per_page].to_i)
    respond_with organizations
  end

  def show
    organization = Organization.find(params[:id])
    respond_with organization
  end

  def new
    respond_with nil
  end

  def create
    organization = Organization::Master.new(organization_params)
    organization.save
    respond_with organization, location: organization_path(organization)
  end

  def edit
  end

  def update
    organization = Organization::Master.find(params[:id])
    version = organization.create_version(organization_params)
    respond_with version
  end

private

  def organization_params
    params.require(:organization).permit(:parent_id, :name, :upload_id, :parent_id,
      :facebook_alias, :twitter_alias, :website, :notes, :country, :region, :city).
      merge(user: current_user)
  end

end