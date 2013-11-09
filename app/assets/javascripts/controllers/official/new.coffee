Whistlr.OfficialNewController = Ember.ObjectController.extend(
  Whistlr.FormOfficialMixin

  actions:
    submit: (event, view) ->
      @get('model').save().then ((response) =>
        @transitionToRoute('official.report', @content)
      ), (response) =>
        @set "errors", response.errors
)