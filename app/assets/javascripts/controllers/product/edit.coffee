Whistlr.ProductEditController = Ember.ObjectController.extend(
  Whistlr.FormProductMixin

  actions:
    submit: (event, view) ->
      @get('model').save().then ((response) =>
        Whistlr.setFlash(Em.I18n.t("flash.resource_edited"), 'notice')
        @transitionToRoute('product.timeline', @content)
      ), (response) =>
        @set "errors", response.errors
)