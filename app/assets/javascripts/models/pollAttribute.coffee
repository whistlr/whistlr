Whistlr.PollAttribute = DS.Model.extend 
  approved: DS.attr()
  declined: DS.attr()
  pending: DS.attr()

  votesYea: DS.attr()
  votesNay: DS.attr()
  votesSum: DS.attr()
  votedFor: DS.attr()

  notes: DS.attr()

  user: DS.belongsTo 'user'

  pollable: DS.belongsTo 'pollable',
    polymorphic: true