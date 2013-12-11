Whistlr.OrganizationOfficialsOwnerNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('affiliation', {organization: @modelFor('organization'), type: "Affiliation::Owner::Master"})
  setupController: (controller, model) ->
    controller.set('content', model)
  deactivate: ->
    @get('controller.content').rollback()
  renderTemplate: ->
    @render "organization/officials/owner/new",
      outlet: "ownerNew"
      into: "organization/officials"
      controller: "organizationOfficialsOwnerNew"