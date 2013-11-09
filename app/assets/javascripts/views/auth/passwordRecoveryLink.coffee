Whistlr.AuthPasswordRecoveryLinkView = Em.View.extend
  templateName: 'auth/link'

  tagName: 'a'
  classNames: ['milli']
  attributeBindings: ['href']
  href: '/password_recovery'
  text: ''
  textTranslation: (->
    Em.I18n.t "#{@text}"
  ).property('text')

  click:  (event, view) ->
    event.preventDefault()
    event.stopPropagation()
    Whistlr.lightbox().send 'setContent', Whistlr.AuthPasswordRecoveryView.create()