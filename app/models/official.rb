class Official < ActiveRecord::Base
  include Attributes::Social
  include Attributes::Uploadable
  include Friendly::SluggableBase

  strip_attributes

  validates :name, presence: true
  validates :bio, allow_blank: true, length: { maximum: 500 }

end