Whistlr.PollableMixin = Ember.Mixin.create
  
  approved: DS.attr()
  declined: DS.attr()
  pending: DS.attr()
  
  pollAttributes: DS.belongsTo 'pollAttribute',
    inverse: 'pollable'

  submittedBy: (->
    @get('pollAttributes.user')
  ).property('pollAttributes.user')

  votesNay: (->
    @get('pollAttributes.votesNay')
  ).property('pollAttributes.votesNay')
  votesYea:  (->
    @get('pollAttributes.votesYea')
  ).property('pollAttributes.votesYea')
  votesSum:  (->
    @get('pollAttributes.votesSum')
  ).property('pollAttributes.votesSum')
  votedFor:  (->
    @get('pollAttributes.votedFor')
  ).property('pollAttributes.votedFor')