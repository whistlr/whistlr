class ComplimentsController < ApplicationController

  respond_to :json, :html

  def index
    random = params[:rand].to_i
    case
    when random < 33
      compliments = case
      when random < 11
        Official::Master.approved.includes(:reportable_attributes).order("reportable_attributes.controversy DESC").limit(6)
      when random < 22
        Official::Master.approved.includes(:reportable_attributes).order("reportable_attributes.favor ASC").limit(6)
      else
        Official::Master.approved.includes(:reportable_attributes).order("reportable_attributes.favor DESC").limit(6)
      end
      respond_with compliments, each_serializer: OfficialSerializer, root: :officials
    when random < 66
      compliments = case
      when random < 44
        Organization::Master.approved.includes(:reportable_attributes).order("reportable_attributes.controversy DESC").limit(6)
      when random < 55
        Organization::Master.approved.includes(:reportable_attributes).order("reportable_attributes.favor ASC").limit(6)
      else
        Organization::Master.approved.includes(:reportable_attributes).order("reportable_attributes.favor DESC").limit(6)
      end
      respond_with compliments, each_serializer: OrganizationSerializer, root: :organizations
    else
      compliments = case
      when random < 77
        Product::Master.approved.includes(:reportable_attributes).order("reportable_attributes.controversy DESC").limit(6)
      when random < 88
        Product::Master.approved.includes(:reportable_attributes).order("reportable_attributes.favor ASC").limit(6)
      else
        Product::Master.approved.includes(:reportable_attributes).order("reportable_attributes.favor DESC").limit(6)
      end
      respond_with compliments, each_serializer: ProductSerializer, root: :products
    end
  end
end
