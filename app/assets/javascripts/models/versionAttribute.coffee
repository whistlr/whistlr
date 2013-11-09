Whistlr.VersionAttribute = DS.Model.extend 
  initial: DS.attr()

  previous: DS.belongsTo 'previous',
    polymorphic: true
  versionable: DS.belongsTo 'versionable',
    polymorphic: true