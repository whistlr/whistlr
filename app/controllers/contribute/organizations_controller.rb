class Contribute::OrganizationsController < ApplicationController

  before_action :set_organization, only: [:show, :edit, :update]
  before_action :instantiate_constants, except: :show
  respond_to :json, :html

  def autocomplete
    organizations = Organization.where("name LIKE ?", "%#{params[:query]}%").select(:name, :id).limit(10)
    render json: organizations
  end

  def index
    @search = Organization.approved.page(params[:page]).search(params[:q])
    @organizations = @search.result(:distinct => true)
    @search.build_condition if @search.conditions.empty?
    @search.sorts = "name desc" if @search.sorts.empty?
    respond_with @organizations
  end

  def show
    @reports = @organization.report_participants.not_denied.includes(:report).order("ABS(reports.responses_sum) DESC").page(params[:page])
    respond_with @organization
  end

  def new
    @organization = Organization.new
    respond_with @organization
  end

  def edit
    authorize! :update, @organization
    @version = @organization.versions.new
    respond_with(@version, responder: TransitionResponder)
  end

  def create
    @organization = Organization.new(organization_params)
    authorize! :create, @organization
    @organization.save
    render json: @organization, status: 201
  end

  def update
    authorize! :update, @organization
    @version = @organization.versions.new(organization_params)
    if @version.save
      redirect_to @organization, notice: t('organization.versions.create.revision_submitted')
    else
      @organization.update_attributes(organization_params)
      update_transition_responder
    end
  end

  private
    def set_organization
      @organization = Organization.find(params[:id])
    end

    def instantiate_constants
      @countries = COUNTRY_ISO_ARRAY
      @years = YEAR_RANGE
    end

    def organization_params
      params.require(:organization).permit(Organization.tracked_attributes).merge(user: current_user)
    end
end