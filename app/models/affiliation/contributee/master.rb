class Affiliation::Contributee::Master < Affiliation::Contributee
  include Versions::Versionable

  def active_model_serializer
    AffiliationSerializer
  end

end