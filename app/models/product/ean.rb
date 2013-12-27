class Product::Ean < ActiveRecord::Base

  strip_attributes

  attr_accessor :_destroy

  has_many :products, through: :product_joins
  has_many :product_joins, class_name: "Product::Ean::Join"

  belongs_to :previous, class_name: "Product::Ean"
  has_one :next, class_name: "Product::Ean", foreign_key: :previous_id

  validates :code, presence: true, numericality: { only_integer: true }, length: { is: 13 }

  def active_model_serializer
    ProductEanSerializer
  end

end
