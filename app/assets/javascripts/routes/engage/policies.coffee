Whistlr.EngagePoliciesRoute = Ember.Route.extend(

  model: ->
    name = Whistlr.searchBar().get('searchQuery') if Whistlr.searchBar() != undefined
    @store.findQuery 'policy',
      pending: "true"
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