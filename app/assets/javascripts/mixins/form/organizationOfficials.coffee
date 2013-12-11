Whistlr.FormOrganizationOfficialsMixin = Ember.Mixin.create

  officialInput: (->
    official = @get 'official'
    if official?
      official.get('name')
  ).property('official.name')

  officialList: (->
    input = @get 'officialInput'
    official = @get 'official'
    if input? && input.length > 2 && (!official? || input != official.get('name'))
      @store.findQuery 'official',
        name: @get 'officialInput'
  ).property('officialInput')

  actions:

    submit: (event, view) ->
      @get('model').save().then ((response) =>
        Whistlr.setFlash(Em.I18n.t("flash.resource_submitted"), 'notice')
        @transitionToRoute('organization.officials')
      ), (response) =>
        @set "errors", response.errors