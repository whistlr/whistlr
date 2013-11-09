Whistlr.FormOrganizationMixin = Ember.Mixin.create

  parentInput: (->
    parent = @get 'parent'
    if parent?
      parent.get('name')
  ).property('parent.name')

  parentList: (->
    input = @get 'parentInput'
    parent = @get 'parent'
    if input? && input.length > 2 && (!parent? || input != parent.get('name'))
      @store.findQuery 'organization',
        name: @get 'parentInput'
  ).property('parentInput')

  errors: null