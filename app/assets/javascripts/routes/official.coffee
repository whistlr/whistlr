Whistlr.OfficialRoute = Ember.Route.extend
  serialize: (model, params) ->
    official_id: model.get('slug')