class EverythingController < ApplicationController
  include Query::Params
  
  respond_to :html, :json

  def index
    officials = Official::Master.where(query_params(Official)).limit(4)
    organizations = Organization::Master.where(query_params(Organization)).limit(4)
    policies = Policy::Master.where(query_params(Policy)).limit(4)
    products = Product::Master.where(query_params(Product)).limit(4)
    respond_with [officials, organizations, policies, products]
  end

end