Whistlr.OfficialNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('official')
  setupController: (controller, model) ->
    controller.set('content', model)
  deactivate: ->
    @get('controller.content').rollback()