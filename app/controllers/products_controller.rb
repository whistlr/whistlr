class ProductsController < ApplicationController
  include Query::Params

  respond_to :json, :html

  def index
    params[:page] ||= 0
    params[:per_page] ||= 25
    products = Product::Master.where(query_params(Product)).offset(params[:page].to_i * params[:per_page].to_i).limit(params[:per_page].to_i)
    respond_with products
  end

  def show
    product = Product.friendly.find(params[:id])
    respond_with product
  end

  def new
    respond_with nil
  end

  def create
    product = Product::Master.new(product_params)
    authorize! :create, product
    product.save
    respond_with product, location: root_path
  end

  def edit
  end

  def update
    product = Product::Master.friendly.find(params[:id])
    authorize! :update, product
    version = product.update_with_nested_models(primary_model_params, nested_model_params)
    respond_with version
  end

private

  def product_attr
    [:name, :upload_id, :organization_id, :facebook_alias, :twitter_alias, :website, :notes]
  end

  def ean_attr
    [:_destroy, :code, :id]
  end

  def product_params
    joined_params.require(:product).permit(product_attr, ean_joins_attributes: [ ean_attributes: ean_attr ]).merge(user: current_user)
  end

  def joined_params
    vetted_params = params.dup
    eans = vetted_params[:product].extract!(:eans_attributes)
    if eans[:eans_attributes].present?
      vetted_params[:product].merge!(ean_joins_attributes: [])
      eans[:eans_attributes].each do |ean|
        vetted_params[:product][:ean_joins_attributes] << {ean_attributes: ean}
      end
    end
    vetted_params
  end

  def primary_model_params
    params.require(:product).permit(product_attr).merge(user: current_user)
  end

  def nested_model_params
    params.require(:product).permit([[eans_attributes: ean_attr]])
  end
end