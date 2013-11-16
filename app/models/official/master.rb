class Official::Master < Official
  include Events::Timelineable
  include Versions::Versionable
  include Reports::Reportable
  include Follows::Followable

  def active_model_serializer
    OfficialSerializer
  end

end