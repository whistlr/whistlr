class ProductEanSerializer < ActiveModel::Serializer
  embed :ids, include: true
  
  attributes :code, :id

  has_one :previous, root: :product_eans

  has_many :products

end
