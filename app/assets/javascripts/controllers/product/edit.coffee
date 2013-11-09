Whistlr.ProductEditController = Ember.ObjectController.extend(
  Whistlr.FormProductMixin

  actions:
    submit: (event, view) ->
      @get('model').save().then ((response) =>
        @transitionToRoute('product.timeline', @content)
      ), (response) =>
        @set "errors", response.errors
)