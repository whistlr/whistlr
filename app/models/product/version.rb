class Product::Version < Product
  include Versions::LikeAVersion
  include Votes::Pollable
  include Votes::Voteable
  include Events::Eventable
  include Stat::Archival

  add_event_to :user, :master

  def active_model_serializer
    ProductVersionSerializer
  end

end