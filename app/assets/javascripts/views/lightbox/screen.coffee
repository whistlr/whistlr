Whistlr.LightboxScreenView = Em.View.extend
  templateName: 'lightbox/screen'

  click: ->
    Whistlr.lightbox().set 'visible', false