Whistlr.ExplorePoliciesRoute = Ember.Route.extend(

  model: ->
    name = Whistlr.searchBar() != undefined ? Whistlr.searchBar().get('searchQuery') || ""
    @store.findQuery 'policy',
      approved: "true"
      name: name

  actions:
    getMore: ->
      controller = @get("controller")
      page = controller.get("page")
      perPage = controller.get("perPage")
      @fetchPage(page, perPage, controller)

  fetchPage: (page, perPage, controller) ->
    $.getJSON "/policies", {page: page, per_page: perPage}, (response) =>
      for policy in response.policies
        @store.push('policy', policy)
      controller.send('gotMore', page + 1)
)