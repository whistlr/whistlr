Whistlr.PolicyReportNewController = Ember.ObjectController.extend(

  errors: null

  actions:
    addParticipant: ->
      participant = @store.createRecord('report.participant')
      @get('participants').pushObject(participant)

    removeParticipant: (participant) ->
      @get('model').get('participants').removeObject participant

    addEvidence: ->
      evidence = @store.createRecord('report.evidence')
      @get('evidence').pushObject(evidence)

    removeEvidence: (evidence) ->
      @get('model').get('evidence').removeObject evidence

    submit: (event, view) ->
      @get('model').save().then ((response) =>
        @transitionToRoute('policy.report')
      ), (response) =>
        @set "errors", response.errors
)