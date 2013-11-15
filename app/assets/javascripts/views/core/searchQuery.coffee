Whistlr.SearchQueryView = Em.View.extend
  templateName: 'core/searchQuery'
  classNames: ['ember-search-field']

  tagName: 'span'
  
  searchQuery: ""

  officials: []
  organizations: []
  policies: []
  products: []

  resourcesActive: (->
    @get('officials')? || @get('organizations')? || @get('policies')? || @get('products')?
  ).property('officials', 'organizations', 'policies', 'products')

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
      @set('policies', store.findQuery 'policy',
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