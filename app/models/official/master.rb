class Official::Master < Official
  include Events::Timelineable
  include Versions::Versionable
  include Reports::Reportable
  include Follows::Followable
  include Friendly::Sluggable

  def active_model_serializer
    OfficialSerializer
  end

  def slug_candidates
    [
      :name
    ]
  end

end