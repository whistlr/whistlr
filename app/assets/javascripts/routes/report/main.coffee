Whistlr.ReportMainRoute = Ember.Route.extend
  model: (params) ->
    @modelFor('report')
  setupController: (controller, model) ->
    controller.set('content', model)