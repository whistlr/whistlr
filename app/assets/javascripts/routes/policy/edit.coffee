Whistlr.PolicyEditRoute = Ember.Route.extend
  model: (params, queryParams, transition) ->
    @modelFor('policy')
  setupController: (controller, model) ->
    controller.set('content', @modelFor('policy'))
  deactivate: ->
    @get('controller.content').rollback()