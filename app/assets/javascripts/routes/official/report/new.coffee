Whistlr.OfficialReportNewRoute = Ember.Route.extend
  model: ->
    report = @store.createRecord('report')
    participant = @store.createRecord('report.participant', {reportable: @modelFor('official')})
    report.get('participants').pushObject(participant)
    report
  setupController: (controller, model) ->
    controller.set('content', model)
  deactivate: ->
    @get('controller.content').rollback()