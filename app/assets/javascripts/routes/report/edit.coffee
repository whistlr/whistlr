Whistlr.ReportEditRoute = Ember.Route.extend
  model: (params, queryParams, transition) ->
    @modelFor('report')
  setupController: (controller, model) ->
    controller.set('content', model)
  deactivate: ->
    @get('controller.content').rollback()