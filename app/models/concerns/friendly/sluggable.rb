module Friendly::Sluggable
  extend ActiveSupport::Concern

  included do
    extend FriendlyId
    friendly_id :slug_candidates, use: :slugged

    validates_presence_of :slug

    def should_generate_new_friendly_id?
      slug.blank? || name_changed?
    end
  end

end
