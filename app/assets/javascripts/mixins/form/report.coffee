Whistlr.FormReportMixin = Ember.Mixin.create

  errors: null

  actions:
    addParticipant: ->
      participant = @store.createRecord('report.participant')
      @get('participants').pushObject(participant)

    removeParticipant: (participant) ->
      participant.set "_destroy", true

    addEvidence: ->
      evidence = @store.createRecord('report.evidence')
      @get('evidence').pushObject(evidence)

    removeEvidence: (evidence) ->
      evidence.set "_destroy", true