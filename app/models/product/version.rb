class Product::Version < Product
  include Versions::LikeAVersion
  include Versions::LikeAVersionThatIsNested
  include Votes::Pollable
  include Votes::Voteable
  include Events::Eventable
  include Stat::Archival

  add_event_to :user, :master

  def active_model_serializer
    ProductVersionSerializer
  end

  def assign_associations_to_master
    delete_removed_associations(:eans)
    add_new_associations(:eans)
  end

private

  def connect_with_master_associates
    if initial?
      eans << master.eans
    end
  end

end