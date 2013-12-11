Whistlr.OfficialOrganizationsOwnerNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('affiliation', {official: @modelFor('official'), type: "Affiliation::Owner::Master"})
  setupController: (controller, model) ->
    controller.set('content', model)
  deactivate: ->
    @get('controller.content').rollback()
  renderTemplate: ->
    @render "official/organizations/owner/new",
      outlet: "ownerNew"
      into: "official/organizations"
      controller: "officialOrganizationsOwnerNew"