Whistlr.AuthSignInView = Em.View.extend
  templateName: 'auth/signIn'

  email: null
  password: null
  remember: false
  errors: null

  submit: (event) ->
    event.preventDefault()
    event.stopPropagation()
    @get('context').auth.signIn
      data:
        "email": @get 'email'
        "password": @get 'password'
        "remember": @get 'remember'
      success: =>
        lightbox = Ember.View.views[$(".ember-lightbox").attr('id')]
        lightbox.set 'visible', false
      error: (jqXHR, textStatus, errorThrown) =>
        @set 'errors', jqXHR.responseText