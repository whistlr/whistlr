Whistlr.AuthRegisterLinkView = Em.View.extend
  templateName: 'auth/link'

  tagName: 'a'
  attributeBindings: ['href']
  href: '/register'
  text: ''
  textTranslation: (->
    Em.I18n.t "#{@text}"
  ).property('text')

  click:  (event, view) ->
    event.preventDefault()
    event.stopPropagation()
    Whistlr.lightbox().send 'setContent', Whistlr.AuthRegisterView.create()