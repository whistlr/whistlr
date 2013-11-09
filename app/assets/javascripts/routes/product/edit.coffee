Whistlr.ProductEditRoute = Ember.Route.extend
  model: (params, queryParams, transition) ->
    @modelFor('product')
  setupController: (controller, model) ->
    controller.set('content', @modelFor('product'))
  deactivate: ->
    @get('controller.content').rollback()