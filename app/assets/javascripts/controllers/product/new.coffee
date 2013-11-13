Whistlr.ProductNewController = Ember.ObjectController.extend(
  Whistlr.FormProductMixin

  actions:
    submit: (event, view) ->
      @get('model').save().then ((response) =>
        Whistlr.setFlash(Em.I18n.t("flash.resource_submitted"), 'notice')
        @transitionToRoute('product.report', @content)
      ), (response) =>
        @set "errors", response.errors
)