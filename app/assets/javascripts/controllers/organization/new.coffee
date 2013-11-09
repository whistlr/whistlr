Whistlr.OrganizationNewController = Ember.ObjectController.extend(
  Whistlr.FormOrganizationMixin

  actions:
    submit: (event, view) ->
      @get('model').save().then ((response) =>
        @transitionToRoute('organization.report', @content)
      ), (response) =>
        @set "errors", response.errors
)