Whistlr.PolicyNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('policy')
  setupController: (controller, model) ->
    controller.set('content', model)
  deactivate: ->
    @get('controller.content').rollback()