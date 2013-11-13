Whistlr.OfficialNewController = Ember.ObjectController.extend(
  Whistlr.FormOfficialMixin

  actions:
    submit: (event, view) ->
      @get('model').save().then ((response) =>
        Whistlr.setFlash(Em.I18n.t("flash.resource_submitted"), 'notice')
        @transitionToRoute('official.report', @content)
      ), (response) =>
        @set "errors", response.errors
)