class AffiliationsController < ApplicationController
  include Query::Params

  respond_to :json, :html

  def index
    respond_with Affiliation.where(query_params(Affiliation)), root: "affiliations"
  end

  def show
    respond_with Affiliation.find(params[:id]), root: "affiliation"
  end

  def new
    respond_with nil
  end

  def create
    relation =  params[:affiliation][:type].constantize.new(affiliation_params)
    authorize! :create, relation
    relation.save
    respond_with relation, location: root_path
  end

  def edit
    respond_with nil
  end

  def update
    relation = Affiliation.find(params[:id])
    authorize! :update, relation
    version = relation.create_version(affiliation_params)
    respond_with version
  end

private

  def affiliation_params
    params.require(:affiliation).permit(:organization_id, :official_id, :start_date, :end_date, :amount, :shares, :title).
      merge(user: current_user)
  end

end