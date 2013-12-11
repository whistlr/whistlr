class Affiliation < ActiveRecord::Base
  strip_attributes

  belongs_to :organization
  belongs_to :official

  validates :organization, presence: true
  validates :official, presence: true

end
