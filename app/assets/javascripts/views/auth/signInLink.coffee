Whistlr.AuthSignInLinkView = Em.View.extend
  templateName: 'auth/link'

  tagName: 'a'
  attributeBindings: ['href']
  href: '/sign_in'
  text: ''
  textTranslation: (->
    Em.I18n.t "#{@text}"
  ).property('text')

  click:  (event, view) ->
    event.preventDefault()
    event.stopPropagation()
    Whistlr.lightbox().send 'setContent', Whistlr.AuthSignInView.create()