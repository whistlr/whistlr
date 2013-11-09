class Official < ActiveRecord::Base
  include Attributes::Social
  include Attributes::Uploadable

  strip_attributes

  validates :name, presence: true

end