Whistlr.OrganizationOfficialsExecutiveNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('affiliation', {organization: @modelFor('organization'), type: "Affiliation::Executive::Master"})
  setupController: (controller, model) ->
    controller.set('content', model)
  deactivate: ->
    @get('controller.content').rollback()
  renderTemplate: ->
    @render "organization/officials/executive/new",
      outlet: "executiveNew"
      into: "organization/officials"
      controller: "organizationOfficialsExecutiveNew"