Whistlr.OfficialEditController = Ember.ObjectController.extend(
  Whistlr.FormOfficialMixin

  actions:
    submit: (event, view) ->
      @get('model').save().then ((response) =>
        @transitionToRoute('official.timeline', @content)
      ), (response) =>
        @set "errors", response.errors
)