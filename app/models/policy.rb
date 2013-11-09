class Policy < ActiveRecord::Base
  include Attributes::Uploadable

  strip_attributes

  belongs_to :organization, -> { where type: "Organization::Master" }, class_name: "Organization"

  validates :name, presence: true

end