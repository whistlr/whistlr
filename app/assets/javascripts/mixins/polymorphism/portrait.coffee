Whistlr.PortraitMixin = Ember.Mixin.create

  upload: DS.belongsTo 'upload'

  image: (->
    if @get('upload')
      "<img class='resource-image' src='#{@get('upload').get('file').url}'></img>"
    else
      "<div class='resource-image resource-image--default-portrait'></div>"
  ).property('upload')
  
  uploadChanged: Whistlr.addVersionRowProperty('uplaod')