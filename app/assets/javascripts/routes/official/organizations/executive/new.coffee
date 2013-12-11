Whistlr.OfficialOrganizationsExecutiveNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('affiliation', {official: @modelFor('official'), type: "Affiliation::Executive::Master"})
  setupController: (controller, model) ->
    controller.set('content', model)
  deactivate: ->
    @get('controller.content').rollback()
  renderTemplate: ->
    @render "official/organizations/executive/new",
      outlet: "executiveNew"
      into: "official/organizations"
      controller: "officialOrganizationsExecutiveNew"