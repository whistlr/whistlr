Whistlr.FormProductMixin = Ember.Mixin.create

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

  actions:
    addEan: ->
      ean = @store.createRecord('product.ean')
      @get('eans').pushObject(ean)

    removeEan: (ean) ->
      ean.set "_destroy", true