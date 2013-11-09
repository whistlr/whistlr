Whistlr.FormPolicyMixin = Ember.Mixin.create

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

  errors: null