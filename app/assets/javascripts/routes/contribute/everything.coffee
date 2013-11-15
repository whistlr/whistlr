Whistlr.ContributeEverythingRoute = Ember.Route.extend

  model: ->
    Em.RSVP.hash
      officials: @store.findQuery 'official',
        pending: "true"
        per_page: 4
      organizations: @store.findQuery 'organization',
        pending: "true"
        per_page: 4
      policies: @store.findQuery 'policy',
        pending: "true"
        per_page: 4
      products: @store.findQuery 'product',
        pending: "true"
        per_page: 4

  setupController: (controller, model) ->
    controller.setProperties(model)