Whistlr.ContributeRecentActivityRoute = Ember.Route.extend
  setupController: (controller, model) ->
    $.getJSON "/contribute/recent_activity", {auth_token: @auth.get 'authToken'}, (response) =>
      for event in response.events
        storedEvent = @store.push('event', event)
        controller.get('content').pushObject(storedEvent)

  actions:
    getMore: ->
      controller = @get("controller")
      page = controller.get("page")
      perPage = controller.get("perPage")
      @fetchPage(page, perPage, controller)

  fetchPage: (page, perPage, controller) ->
    $.getJSON "/contribute/recent_activity", {page: page, per_page: perPage, auth_token: @auth.get 'authToken'}, (response) =>
      for event in response.events
        storedEvent = @store.push('event', event)
        controller.get('content').pushObject(storedEvent)
      controller.send('gotMore', page + 1)