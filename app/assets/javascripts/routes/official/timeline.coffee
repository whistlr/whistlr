Whistlr.OfficialTimelineRoute = Ember.Route.extend
  model: (params) ->
    @store.findQuery 'event',
      timelineable_type: "Official",
      timelineable_id: @modelFor('official').get('id')
  setupController: (controller, model) ->
    controller.set('official', @modelFor('official'))
    controller.set('content', model)

  actions:
    getMore: ->
      controller = @get("controller")
      page = controller.get("page")
      perPage = controller.get("perPage")
      @fetchPage(page, perPage, controller)

  fetchPage: (page, perPage, controller) ->
    $.getJSON "/events", {page: page, per_page: perPage, timelineable_type: "Official"}, (response) =>
      for event in response.events
        @store.push('event', event)
      controller.send('gotMore', page + 1)