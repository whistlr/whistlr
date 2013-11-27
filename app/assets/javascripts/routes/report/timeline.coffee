Whistlr.ReportTimelineRoute = Ember.Route.extend
  model: (params) ->
    @store.findQuery 'event',
      timelineable_type: "Report",
      timelineable_id: @modelFor('report').get('id')
  setupController: (controller, model) ->
    controller.set('report', @modelFor('report'))
    controller.set('content', model)

  actions:
    getMore: ->
      controller = @get("controller")
      page = controller.get("page")
      perPage = controller.get("perPage")
      @fetchPage(page, perPage, controller)

  fetchPage: (page, perPage, controller) ->
    $.getJSON "/events", {page: page, per_page: perPage, timelineable_type: "Report"}, (response) =>
      for event in response.events
        @store.push('event', event)
      controller.send('gotMore', page + 1)