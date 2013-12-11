Whistlr.Official = DS.Model.extend Whistlr.EventableMixin, Whistlr.ReportableMixin, Whistlr.VersionableMixin, Whistlr.PollableMixin, Whistlr.SocialMixin, Whistlr.PortraitMixin, Whistlr.FollowableMixin, Whistlr.SluggableMixin,

  model: "Official"
  modelCamelized: "official"

  versions: DS.hasMany 'official',
    inverse: 'master'
  master: DS.belongsTo 'official',
    inverse: 'versions'

  relations: DS.hasMany 'affiliation',
    inverse: 'official'
    
  name: DS.attr()
  bio: DS.attr()

  nameChanged: Whistlr.addVersionRowProperty('name')
  bioChanged: Whistlr.addVersionRowProperty('bio')