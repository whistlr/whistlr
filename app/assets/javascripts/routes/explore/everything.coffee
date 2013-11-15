Whistlr.ExploreEverythingRoute = Ember.Route.extend

  model: ->
    Em.RSVP.hash
      officials: @store.findQuery 'official',
        approved: "true"
        per_page: 5
      organizations: @store.findQuery 'organization',
        approved: "true"
        per_page: 5
      policies: @store.findQuery 'policy',
        approved: "true"
        per_page: 5
      products: @store.findQuery 'product',
        approved: "true"
        per_page: 5

  setupController: (controller, model) ->
    controller.setProperties(model)