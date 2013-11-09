Whistlr.OfficialEditRoute = Ember.Route.extend
  model: (params, queryParams, transition) ->
    @modelFor('official')
  setupController: (controller, model) ->
    controller.set('content', @modelFor('official'))
  deactivate: ->
    @get('controller.content').rollback()