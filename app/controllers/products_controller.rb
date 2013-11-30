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
    version = product.create_version(product_params)
    respond_with version
  end

private

  def product_params
    params.require(:product).permit(:name, :upload_id, :organization_id,
      :facebook_alias, :twitter_alias, :website, :notes).
      merge(user: current_user)
  end

end