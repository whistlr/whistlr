class Affiliation::Executive < Affiliation

  #validates :start_date, presence: true, numericality: { only_integer: true }, length: { is: 4 }
  #validates :end_date, allow_nil: true, numericality: { only_integer: true }, length: { is: 4 }
  validates :title, presence: true

end
