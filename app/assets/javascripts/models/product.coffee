Whistlr.Product = DS.Model.extend Whistlr.EventableMixin, Whistlr.ReportableMixin, Whistlr.VersionableMixin, Whistlr.PollableMixin, Whistlr.SocialMixin, Whistlr.LogoMixin, Whistlr.FollowableMixin, Whistlr.SluggableMixin,

  model: "Product"
  modelCamelized: "product"

  versions: DS.hasMany 'product',
    inverse: 'master'
  master: DS.belongsTo 'product',
    inverse: 'versions'
    
  name: DS.attr()
  ean13: DS.attr()

  organization: DS.belongsTo 'organization'

  nameChanged: Whistlr.addVersionRowProperty('name')
  organizationChanged: Whistlr.addVersionRowProperty('organization')
  ean13Changed: Whistlr.addVersionRowProperty('ean13')