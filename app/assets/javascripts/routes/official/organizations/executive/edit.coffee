Whistlr.OfficialOrganizationsExecutiveEditRoute = Ember.Route.extend
  model: (params, queryParams, transition) ->
    @store.find('affiliation', params.affiliation_id)
  setupController: (controller, model) ->
    controller.set('content', model)
  deactivate: ->
    @get('controller.content').rollback()
  renderTemplate: ->
    @render "official/organizations/executive/edit",
      outlet: "executiveNew"
      into: "official/organizations"
      controller: "officialOrganizationsExecutiveEdit"