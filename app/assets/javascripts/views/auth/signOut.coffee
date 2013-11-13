Whistlr.AuthSignOutView = Em.View.extend
  templateName: 'auth/signOut'

  click: (event, view) ->
    event.preventDefault()
    event.stopPropagation()
    @get('context').auth.signOut
      success: ->
        document.location.href="/"