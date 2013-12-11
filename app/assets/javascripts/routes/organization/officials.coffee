Whistlr.OrganizationOfficialsRoute = Ember.Route.extend

  model: (params) ->
    Em.RSVP.hash
      contributees: @store.findQuery 'affiliation',
        approved: "true"
        type: "Affiliation::Contributee::Master"
        organization_id: @modelFor('organization').get('id')
      executives: @store.findQuery 'affiliation',
        approved: "true"
        type: "Affiliation::Executive::Master"
        organization_id: @modelFor('organization').get('id')
      owners: @store.findQuery 'affiliation',
        approved: "true"
        type: "Affiliation::Owner::Master"
        organization_id: @modelFor('organization').get('id')

  setupController: (controller, model) ->
    controller.set('organization', @modelFor('organization'))
    controller.setProperties(model)