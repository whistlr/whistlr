Whistlr.OfficialOrganizationsContributeeNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('affiliation', {official: @modelFor('official'), type: "Affiliation::Contributee::Master"})
  setupController: (controller, model) ->
    controller.set('content', model)
  deactivate: ->
    @get('controller.content').rollback()
  renderTemplate: ->
    @render "official/organizations/contributee/new",
      outlet: "contributeeNew"
      into: "official/organizations"
      controller: "officialOrganizationsContributeeNew"