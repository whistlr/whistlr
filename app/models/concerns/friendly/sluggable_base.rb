module Friendly::SluggableBase
  extend ActiveSupport::Concern

  included do
    extend FriendlyId
    friendly_id :slug, use: :history
  end

end
