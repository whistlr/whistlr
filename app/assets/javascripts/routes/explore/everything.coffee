Whistlr.ExploreEverythingRoute = Ember.Route.extend

  model: ->
    name = Whistlr.searchBar().get('searchQuery') if Whistlr.searchBar() != undefined
    Em.RSVP.hash
      officials: @store.findQuery 'official',
        approved: "true"
        name: name
        per_page: 5
      organizations: @store.findQuery 'organization',
        approved: "true"
        name: name
        per_page: 5
      policies: @store.findQuery 'policy',
        approved: "true"
        name: name
        per_page: 5
      products: @store.findQuery 'product',
        approved: "true"
        name: name
        per_page: 5

  setupController: (controller, model) ->
    controller.setProperties(model)