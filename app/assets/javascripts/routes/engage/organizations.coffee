Whistlr.EngageOrganizationsRoute = Ember.Route.extend(

  model: ->
    name = Whistlr.searchBar().get('searchQuery') if Whistlr.searchBar() != undefined
    @store.findQuery 'organization',
      pending: "true"
      name: name

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