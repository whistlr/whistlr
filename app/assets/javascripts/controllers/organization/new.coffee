Whistlr.OrganizationNewController = Ember.ObjectController.extend(
  Whistlr.FormOrganizationMixin

  actions:
    submit: (event, view) ->
      @get('model').save().then ((response) =>
        Whistlr.setFlash(Em.I18n.t("flash.resource_submitted"), 'notice')
        @transitionToRoute('organization.report', @content)
      ), (response) =>
        @set "errors", response.errors
)