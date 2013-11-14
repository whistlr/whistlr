Whistlr.ContributeEverythingRoute = Ember.Route.extend

  model: ->
    name = Whistlr.searchBar().get('searchQuery') if Whistlr.searchBar() != undefined
    Em.RSVP.hash
      officials: @store.findQuery 'official',
        pending: "true"
        name: name
        per_page: 4
      organizations: @store.findQuery 'organization',
        pending: "true"
        name: name
        per_page: 4
      policies: @store.findQuery 'policy',
        pending: "true"
        name: name
        per_page: 4
      products: @store.findQuery 'product',
        pending: "true"
        name: name
        per_page: 4

  setupController: (controller, model) ->
    controller.setProperties(model)