Whistlr.PolicyNewController = Ember.ObjectController.extend(
  Whistlr.FormPolicyMixin

  actions:
    submit: (event, view) ->
      @get('model').save().then ((response) =>
        Whistlr.setFlash(Em.I18n.t("flash.resource_submitted"), 'notice')
        @transitionToRoute('policy.report', @content)
      ), (response) =>
        @set "errors", response.errors
)