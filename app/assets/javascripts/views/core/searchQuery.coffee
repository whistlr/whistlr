Whistlr.SearchQueryView = Em.View.extend
  templateName: 'core/searchQuery'
  classNames: ['ember-search-field']

  tagName: 'span'
  
  searchQuery: ""

  officials: []
  organizations: []
  products: []

  resourcesActive: (->
    @get('officials')? || @get('organizations')? || @get('products')?
  ).property('officials', 'organizations', 'products')

  resourceList: (->
    input = @get 'searchQuery'
    if input? && input.length > 2
      store = @get('context.store')
      @set('officials', store.findQuery 'official',
        approved: "true"
        name: input
        per_page: 3
      )
      @set('organizations', store.findQuery 'organization',
        approved: "true"
        name: input
        per_page: 3
      )
      @set('products', store.findQuery 'product',
        approved: "true"
        name: input
        per_page: 3
      )
  ).property('searchQuery')