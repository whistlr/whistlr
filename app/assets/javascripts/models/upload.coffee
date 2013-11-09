Whistlr.Upload = DS.Model.extend
  file: DS.attr()
  organizations: DS.hasMany 'organization'
  user: DS.belongsTo 'user'