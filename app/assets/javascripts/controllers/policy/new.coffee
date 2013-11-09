Whistlr.PolicyNewController = Ember.ObjectController.extend(
  Whistlr.FormPolicyMixin

  actions:
    submit: (event, view) ->
      @get('model').save().then ((response) =>
        @transitionToRoute('policy.report', @content)
      ), (response) =>
        @set "errors", response.errors
)