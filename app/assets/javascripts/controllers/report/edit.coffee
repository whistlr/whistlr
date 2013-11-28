Whistlr.ReportEditController = Ember.ObjectController.extend(Whistlr.FormReportMixin,

  actions:
    submit: (event, view) ->
      @get('model').save().then ((response) =>
        Whistlr.setFlash(Em.I18n.t("flash.resource_edited"), 'notice')
        @transitionToRoute('report.timeline', @content)
      ), (response) =>
        @set "errors", response.errors
)