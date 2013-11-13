Whistlr.OrganizationEditController = Ember.ObjectController.extend(
  Whistlr.FormOrganizationMixin

  actions:
    submit: (event, view) ->
      @get('model').save().then ((response) =>
        Whistlr.setFlash(Em.I18n.t("flash.resource_edited"), 'notice')
        @transitionToRoute('organization.timeline', @content)
      ), (response) =>
        @set "errors", response.errors
)