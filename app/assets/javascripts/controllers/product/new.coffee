Whistlr.ProductNewController = Ember.ObjectController.extend(
  Whistlr.FormProductMixin

  actions:
    submit: (event, view) ->
      @get('model').save().then ((response) =>
        @transitionToRoute('product.report', @content)
      ), (response) =>
        @set "errors", response.errors
)