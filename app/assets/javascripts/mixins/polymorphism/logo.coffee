Whistlr.LogoMixin = Ember.Mixin.create

  upload: DS.belongsTo 'upload'

  image: (->
    if @get('upload')
      "<img class='resource-image' src='#{@get('upload').get('file').url}'></img>"
    else
      "<div class='resource-image resource-image--default-logo'></div>"
  ).property('upload')

  imageMini: (->
    if @get('upload')
      "<img class='resource-image' src='#{@get('upload').get('file').url}' width=110 height=110></img>"
    else
      "<div class='resource-image resource-image--default-logo' width=110 height=110></div>"
  ).property('upload')
  
  uploadChanged: Whistlr.addVersionRowProperty('uplaod')