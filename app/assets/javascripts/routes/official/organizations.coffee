Whistlr.OfficialOrganizationsRoute = Ember.Route.extend

  model: ->
    Em.RSVP.hash
      contributees: @store.findQuery 'affiliation',
        approved: "true"
        type: "Affiliation::Contributee::Master"
        official_id: @modelFor('official').get('id')
      executives: @store.findQuery 'affiliation',
        approved: "true"
        type: "Affiliation::Executive::Master"
        official_id: @modelFor('official').get('id')
      owners: @store.findQuery 'affiliation',
        approved: "true"
        type: "Affiliation::Owner::Master"
        official_id: @modelFor('official').get('id')

  setupController: (controller, model) ->
    controller.set('official', @modelFor('official'))
    controller.setProperties(model)