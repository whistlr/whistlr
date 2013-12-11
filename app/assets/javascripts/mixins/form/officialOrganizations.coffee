Whistlr.FormOfficialOrganizationsMixin = Ember.Mixin.create

  organizationInput: (->
    organization = @get 'organization'
    if organization?
      organization.get('name')
  ).property('organization.name')

  organizationList: (->
    input = @get 'organizationInput'
    organization = @get 'organization'
    if input? && input.length > 2 && (!organization? || input != organization.get('name'))
      @store.findQuery 'organization',
        name: @get 'organizationInput'
  ).property('organizationInput')

  actions:

    submit: (event, view) ->
      @get('model').save().then ((response) =>
        Whistlr.setFlash(Em.I18n.t("flash.resource_submitted"), 'notice')
        @transitionToRoute('official.organizations')
      ), (response) =>
        @set "errors", response.errors