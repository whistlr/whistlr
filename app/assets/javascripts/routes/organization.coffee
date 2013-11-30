Whistlr.OrganizationRoute = Ember.Route.extend
  serialize: (model, params) ->
    organization_id: model.get('slug')