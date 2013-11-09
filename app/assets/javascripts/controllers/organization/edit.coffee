Whistlr.OrganizationEditController = Ember.ObjectController.extend(
  Whistlr.FormOrganizationMixin

  actions:
    submit: (event, view) ->
      @get('model').save().then ((response) =>
        @transitionToRoute('organization.timeline', @content)
      ), (response) =>
        @set "errors", response.errors
)