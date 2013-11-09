Whistlr.PolicyReportNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('report')
  setupController: (controller, model) ->
    controller.set('content', model)
  deactivate: ->
    @get('controller.content').rollback()