class Product::Master < Product
  include Events::Timelineable
  include Versions::Versionable
  include Reports::Reportable
  include Follows::Followable
  include Friendly::Sluggable

  def active_model_serializer
    ProductSerializer
  end

  def slug_candidates
    [
      :name,
      [:name, :organization_name]
    ]
  end

end