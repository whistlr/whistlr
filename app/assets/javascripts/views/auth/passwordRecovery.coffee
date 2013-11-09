Whistlr.AuthPasswordRecoveryView = Ember.View.extend
  templateName: "auth/passwordRecovery"

  email: ''
  errors: null
  submitting: false

  submit: (event, view) ->
    event.preventDefault()
    event.stopPropagation()
    @set 'errors', null
    @set 'submitting', true
    $.ajax
      url: '/auth/password'
      type: "POST"
      data:
        "master[email]": @get 'email'
      success: =>
        lightbox = Ember.View.views[$(".ember-lightbox").attr('id')]
        lightbox.set 'visible', false
      error: (jqXHR, textStatus, errorThrown) =>
        @set 'errors', jqXHR.responseText
      complete: =>
        @set 'submitting', false