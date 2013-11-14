Whistlr.PolicyReportNewRoute = Ember.Route.extend
  model: ->
    report = @store.createRecord('report')
    participant = @store.createRecord('report.participant', {reportable: @modelFor('policy')})
    report.get('participants').pushObject(participant)
    report
  setupController: (controller, model) ->
    controller.set('content', model)
  deactivate: ->
    @get('controller.content').rollback()