class Product < ActiveRecord::Base
  include Attributes::Social
  include Attributes::Uploadable
  include Friendly::SluggableBase

  strip_attributes

  has_many :ean_joins, class_name: "Product::Ean::Join", inverse_of: :product
  has_many :eans, class_name: "Product::Ean", through: :ean_joins
  belongs_to :organization, -> { where type: "Organization::Master" }, class_name: "Organization"

  validates :name, presence: true
  validates :organization, presence: true

  accepts_nested_attributes_for :ean_joins

  delegate :name, to: :organization, prefix: true

end