class Affiliation::Owner::Version < Affiliation::Owner
  include Versions::LikeAVersion
  include Votes::Pollable
  include Votes::Voteable
  include Events::Eventable
  include Stat::Archival

  add_event_to :user, :organization, :official

  def active_model_serializer
    AffiliationVersionSerializer
  end

end