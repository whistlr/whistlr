Whistlr.ProductRoute = Ember.Route.extend
  serialize: (model, params) ->
    product_id: model.get('slug')