class Official::Version < Official
  include Versions::LikeAVersion
  include Votes::Pollable
  include Votes::Voteable
  include Events::Eventable
  include Stat::Archival

  add_event_to :user, :master

  def active_model_serializer
    OfficialVersionSerializer
  end

end