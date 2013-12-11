class Affiliation::Executive::Master < Affiliation::Executive
  include Versions::Versionable

  def active_model_serializer
    AffiliationSerializer
  end

end