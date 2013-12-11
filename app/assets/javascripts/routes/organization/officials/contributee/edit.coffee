Whistlr.OrganizationOfficialsContributeeEditRoute = Ember.Route.extend
  model: (params, queryParams, transition) ->
    @store.find('affiliation', params.affiliation_id)
  setupController: (controller, model) ->
    controller.set('content', model)
  deactivate: ->
    @get('controller.content').rollback()
  renderTemplate: ->
    @render "organization/officials/contributee/edit",
      outlet: "contributeeNew"
      into: "organization/officials"
      controller: "organizationOfficialsContributeeEdit"