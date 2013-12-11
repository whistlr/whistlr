Whistlr.OrganizationOfficialsExecutiveEditRoute = Ember.Route.extend
  model: (params, queryParams, transition) ->
    @store.find('affiliation', params.affiliation_id)
  setupController: (controller, model) ->
    controller.set('content', model)
  deactivate: ->
    @get('controller.content').rollback()
  renderTemplate: ->
    @render "organization/officials/executive/edit",
      outlet: "executiveNew"
      into: "organization/officials"
      controller: "organizationOfficialsExecutiveEdit"