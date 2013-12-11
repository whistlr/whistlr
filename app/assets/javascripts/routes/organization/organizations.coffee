Whistlr.OrganizationOrganizationsRoute = Ember.Route.extend(

  model: (params) ->
    @store.findQuery 'organization',
      approved: "true",
      parent_id: @modelFor('organization').get('id')

  actions:
    getMore: ->
      controller = @get("controller")
      page = controller.get("page")
      perPage = controller.get("perPage")
      @fetchPage(page, perPage, controller)

  fetchPage: (page, perPage, controller) ->
    $.getJSON "/organizations", {page: page, per_page: perPage}, (response) =>
      for organization in response.organizations
        @store.push('organization', organization)
      controller.send('gotMore', page + 1)
)