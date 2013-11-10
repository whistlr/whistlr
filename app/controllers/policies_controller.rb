class PoliciesController < ApplicationController
  include Query::Params

  respond_to :json, :html

  def index
    params[:page] ||= 0
    params[:per_page] ||= 25
    policies = Policy::Master.where(query_params(Policy)).offset(params[:page].to_i * params[:per_page].to_i).limit(params[:per_page].to_i)
    respond_with policies
  end

  def show
    policy = Policy.find(params[:id])
    respond_with policy
  end

  def new
    respond_with nil
  end

  def create
    policy = Policy::Master.new(policy_params)
    authorize! :create, policy
    policy.save
    respond_with policy, location: root_path
  end

  def edit
  end

  def update
    policy = Policy::Master.find(params[:id])
    authorize! :update, policy
    version = policy.create_version(policy_params)
    respond_with version
  end

private

  def policy_params
    params.require(:policy).permit(:name, :upload_id, :organization_id, :notes).
      merge(user: current_user)
  end

end