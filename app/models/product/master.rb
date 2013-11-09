class Product::Master < Product
  include Events::Timelineable
  include Versions::Versionable
  include Reports::Reportable

  def active_model_serializer
    ProductSerializer
  end

end