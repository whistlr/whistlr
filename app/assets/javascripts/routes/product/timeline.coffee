Whistlr.ProductTimelineRoute = Ember.Route.extend
  model: (params) ->
    @store.findQuery 'event',
      timelineable_type: "Product",
      timelineable_id: @modelFor('product').get('id')
  setupController: (controller, model) ->
    controller.set('product', @modelFor('product'))
    controller.set('content', model)

  actions:
    getMore: ->
      controller = @get("controller")
      page = controller.get("page")
      perPage = controller.get("perPage")
      @fetchPage(page, perPage, controller)

  fetchPage: (page, perPage, controller) ->
    $.getJSON "/events", {page: page, per_page: perPage, timelineable_type: "Product"}, (response) =>
      for event in response.events
        @store.push('event', event)
      controller.send('gotMore', page + 1)