class Organization::Master < Organization
  include Events::Timelineable
  include Versions::Versionable
  include Reports::Reportable
  include Follows::Followable
  include Friendly::Sluggable

  def active_model_serializer
    OrganizationSerializer
  end

  def slug_candidates
    [
      :name,
      [:name, :country],
      [:name, :region, :country],
      [:name, :city, :region, :country]
    ]
  end

end