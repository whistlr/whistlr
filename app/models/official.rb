class Official < ActiveRecord::Base
  include Attributes::Social
  include Attributes::Uploadable
  include Friendly::SluggableBase

  strip_attributes

  validates :name, presence: true

end