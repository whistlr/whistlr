class Affiliation::Owner < Affiliation

  validates :shares, presence: true, numericality: {less_than_or_equal_to: 100}

end
