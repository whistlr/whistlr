Whistlr.OfficialReportNewController = Ember.ObjectController.extend(Whistlr.FormReportMixin,

  actions:

    submit: (event, view) ->
      @get('model').save().then ((response) =>
        Whistlr.setFlash(Em.I18n.t("flash.resource_submitted"), 'notice')
        @transitionToRoute('official.report')
      ), (response) =>
        @set "errors", response.errors
)