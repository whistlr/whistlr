Whistlr.OrganizationEditRoute = Ember.Route.extend
  model: (params, queryParams, transition) ->
    @modelFor('organization')
  setupController: (controller, model) ->
    controller.set('content', @modelFor('organization'))
  deactivate: ->
    @get('controller.content').rollback()