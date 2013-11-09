Whistlr.OrganizationNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('organization')
  setupController: (controller, model) ->
    controller.set('content', model)
  deactivate: ->
    @get('controller.content').rollback()