class Affiliation < ActiveRecord::Base
  strip_attributes

  belongs_to :organization
  belongs_to :official

  validates :organization, presence: true
  validates :official, presence: true

  def amount=(num)
    self[:amount] = num.to_s.scan(/\b-?[\d.]+/).join.to_f
  end

end
