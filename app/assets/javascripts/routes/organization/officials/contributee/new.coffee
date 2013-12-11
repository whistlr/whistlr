Whistlr.OrganizationOfficialsContributeeNewRoute = Ember.Route.extend
  model: ->
    @store.createRecord('affiliation', {organization: @modelFor('organization'), type: "Affiliation::Contributee::Master"})
  setupController: (controller, model) ->
    controller.set('content', model)
  deactivate: ->
    @get('controller.content').rollback()
  renderTemplate: ->
    @render "organization/officials/contributee/new",
      outlet: "contributeeNew"
      into: "organization/officials"
      controller: "organizationOfficialsContributeeNew"