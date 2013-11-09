Whistlr.LogoMixin = Ember.Mixin.create

  image: (->
    if @get('upload')
      "<img class='resource-image' src='#{@get('upload').get('file').url}'></img>"
    else
      "<div class='resource-image resource-image--default-logo'></div>"
  ).property('upload')
  
  uploadChanged: Whistlr.addVersionRowProperty('uplaod')