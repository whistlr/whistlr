class Affiliation::Owner::Master < Affiliation::Owner
  include Versions::Versionable

  def active_model_serializer
    AffiliationSerializer
  end

end