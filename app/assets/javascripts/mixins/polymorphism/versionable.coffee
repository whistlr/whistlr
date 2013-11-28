Whistlr.VersionableMixin = Ember.Mixin.create
  type: DS.attr()

  notes: DS.attr()
  
  versionAttributes: DS.belongsTo 'versionAttribute'

  previousVersion: (->
    @get('versionAttributes.previous')
  ).property('versionAttributes.previous')