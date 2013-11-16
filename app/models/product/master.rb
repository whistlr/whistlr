class Product::Master < Product
  include Events::Timelineable
  include Versions::Versionable
  include Reports::Reportable
  include Follows::Followable

  def active_model_serializer
    ProductSerializer
  end

end