class Product::Ean::Join < ActiveRecord::Base
  belongs_to :product
  belongs_to :ean, class_name: "Product::Ean"

  accepts_nested_attributes_for :ean
end
