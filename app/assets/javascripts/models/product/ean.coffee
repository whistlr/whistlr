Whistlr.ProductEan = DS.Model.extend

  model: "Product::Ean"

  code: DS.attr()

  _destroy: DS.attr 'boolean', {defaultValue: false}

  products: DS.hasMany 'product',
    inverse: 'eans'

  previous: DS.belongsTo 'product.ean',
    inverse: 'next'
  next: DS.belongsTo 'product.ean',
    inverse: 'previous'

  previousVersion: (->
    @get('previous')
  ).property('previous')