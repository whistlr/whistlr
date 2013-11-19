Whistlr.ComplimentaryView = Em.View.extend
  templateName: 'core/complimentary'
  classNames: ['ember-complimentary']
  
  officials: []
  organizations: []
  products: []

  rand: 0

  title: (->
    rand = @get 'rand'
    if rand < 11
      Em.I18n.t("compliments.controversal_officials")
    else if rand < 22
      Em.I18n.t("compliments.disfavored_officials")
    else if rand < 33
      Em.I18n.t("compliments.favored_officials")
    else if rand < 44
      Em.I18n.t("compliments.controversal_organizations")
    else if rand < 55
      Em.I18n.t("compliments.disfavored_organizations")
    else if rand < 66
      Em.I18n.t("compliments.favored_organizations")
    else if rand < 77
      Em.I18n.t("compliments.controversal_products")
    else if rand < 88
      Em.I18n.t("compliments.disfavored_officials")
    else
      Em.I18n.t("compliments.favored_officials")
  ).property('rand')

  init: ->
    @set('rand', Math.floor(Math.random() * 100 ) )
    $.getJSON "/compliments", {rand: @get('rand')}, (response) =>
      store = @get('context').store
      @get('officials').clear()
      @get('organizations').clear()
      @get('products').clear()
      if response.uploads?
        for upload in response.uploads
          store.push('upload', upload)
      if response.officials?
        for official in response.officials
          stored = store.push('official', official)
          if official.upload_id?
            stored.set('upload', store.find('upload', official.upload_id))
          @get('officials').pushObject(stored)
      if response.organizations?
        for organization in response.organizations
          stored = store.push('organization', organization)
          if organization.upload_id?
            stored.set('upload', store.find('upload', organization.upload_id))
          @get('organizations').pushObject(stored)
      if response.products?
        for product in response.products
          stored = store.push('product', product)
          if product.upload_id?
            stored.set('upload', store.find('upload', product.upload_id))
          @get('products').pushObject(stored)
    @_super()