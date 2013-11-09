class Organization::Master < Organization
  include Events::Timelineable
  include Versions::Versionable
  include Reports::Reportable

  def active_model_serializer
    OrganizationSerializer
  end

end