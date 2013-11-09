Whistlr.PolicyEditController = Ember.ObjectController.extend(
  Whistlr.FormPolicyMixin

  actions:
    submit: (event, view) ->
      @get('model').save().then ((response) =>
        @transitionToRoute('policy.timeline', @content)
      ), (response) =>
        @set "errors", response.errors
)