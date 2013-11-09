Whistlr.Event = DS.Model.extend
  eventable: DS.belongsTo 'eventable',
    polymorphic: true
  timelineable: DS.belongsTo 'timelineable',
    polymorphic: true
  createdAt: DS.attr()