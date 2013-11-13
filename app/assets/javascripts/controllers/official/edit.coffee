Whistlr.OfficialEditController = Ember.ObjectController.extend(
  Whistlr.FormOfficialMixin

  actions:
    submit: (event, view) ->
      @get('model').save().then ((response) =>
        Whistlr.setFlash(Em.I18n.t("flash.resource_edited"), 'notice')
        @transitionToRoute('official.timeline', @content)
      ), (response) =>
        @set "errors", response.errors
)