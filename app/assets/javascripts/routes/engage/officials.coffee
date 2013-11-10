Whistlr.EngageOfficialsRoute = Ember.Route.extend(

  model: ->
    name = Whistlr.searchBar() != undefined ? Whistlr.searchBar().get('searchQuery') || ""
    @store.findQuery 'official',
      pending: "true"
      name: name

  actions:
    getMore: ->
      controller = @get("controller")
      page = controller.get("page")
      perPage = controller.get("perPage")
      @fetchPage(page, perPage, controller)

  fetchPage: (page, perPage, controller) ->
    $.getJSON "/officials", {page: page, per_page: perPage}, (response) =>
      for official in response.officials
        @store.push('official', official)
      controller.send('gotMore', page + 1)
)