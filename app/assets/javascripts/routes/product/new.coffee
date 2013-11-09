Whistlr.ProductNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('product')
  setupController: (controller, model) ->
    controller.set('content', model)
  deactivate: ->
    @get('controller.content').rollback()