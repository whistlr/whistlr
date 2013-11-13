Whistlr.AuthSignOutView = Em.View.extend
  templateName: 'auth/signOut'

  click: (event, view) ->
    event.preventDefault()
    event.stopPropagation()
    @get('context').auth.signOut
      success: ->
        Whistlr.setFlash(Em.I18n.t("devise.sign_out_successful"), 'notice')
        document.location.href="/"