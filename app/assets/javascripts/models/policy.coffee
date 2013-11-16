Whistlr.Policy = DS.Model.extend Whistlr.EventableMixin, Whistlr.ReportableMixin, Whistlr.VersionableMixin, Whistlr.PollableMixin, Whistlr.LogoMixin, Whistlr.FollowableMixin,

  model: "Policy"
  modelCamelized: "policy"

  versions: DS.hasMany 'policy',
    inverse: 'master'
  master: DS.belongsTo 'policy',
    inverse: 'versions'
    
  name: DS.attr()

  organization: DS.belongsTo 'organization'

  nameChanged: Whistlr.addVersionRowProperty('name')
  organizationChanged: Whistlr.addVersionRowProperty('organization')