Whistlr.ExploreProductsRoute = Ember.Route.extend(

  model: ->
    @store.findQuery 'product',
      approved: "true"

  actions:
    getMore: ->
      controller = @get("controller")
      page = controller.get("page")
      perPage = controller.get("perPage")
      @fetchPage(page, perPage, controller)

  fetchPage: (page, perPage, controller) ->
    $.getJSON "/products", {page: page, per_page: perPage}, (response) =>
      for product in response.products
        @store.push('product', product)
      controller.send('gotMore', page + 1)
)