Whistlr.Product = DS.Model.extend Whistlr.EventableMixin, Whistlr.ReportableMixin, Whistlr.VersionableMixin, Whistlr.PollableMixin, Whistlr.SocialMixin, Whistlr.LogoMixin, Whistlr.FollowableMixin, Whistlr.SluggableMixin,

  model: "Product"
  modelCamelized: "product"

  versions: DS.hasMany 'product',
    inverse: 'master'
  master: DS.belongsTo 'product',
    inverse: 'versions'

  eans: DS.hasMany('product.ean', nested: true),
    inverse: 'products'
    
  name: DS.attr()

  organization: DS.belongsTo 'organization'

  nameChanged: Whistlr.addVersionRowProperty('name')
  organizationChanged: Whistlr.addVersionRowProperty('organization')

  changedEans: (->
    ean = @get 'eans.content'
    previousEan = @get 'previousVersion.eans.content'
    alteredEan = Whistlr.alteredProperties previousEan, ean
    if alteredEan
      return alteredEan
    else
      return false
  ).property('previousVersion')

  removedEans: (->
    ean = @get 'eans.content'
    previousEan = @get 'previousVersion.eans.content'
    alteredEan = Whistlr.removedProperties previousEan, ean
    if alteredEan
      return alteredEan
    else
      return false
  ).property('previousVersion')