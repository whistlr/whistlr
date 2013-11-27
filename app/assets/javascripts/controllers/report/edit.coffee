Whistlr.ReportEditController = Ember.ObjectController.extend(

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
        Whistlr.setFlash(Em.I18n.t("flash.resource_edited"), 'notice')
        @transitionToRoute('report.timeline', @content)
      ), (response) =>
        @set "errors", response.errors
)