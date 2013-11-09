Whistlr.AuthRegisterView = Ember.View.extend
  templateName: "auth/register"

  name: ''
  email: ''
  password: ''
  password_confirmation: ''
  errors: null
  submitting: false

  submit: (event, view) ->
    event.preventDefault()
    event.stopPropagation()
    @set 'errors', null
    @set 'submitting', true
    $.ajax
      url: '/users'
      type: "POST"
      data:
        "user[name]": @get 'name'
        "user[email]": @get 'email'
        "user[password]": @get 'password'
        "user[password_confirmation]": @get 'password_confirmation'
      success: =>
        lightbox = Ember.View.views[$(".ember-lightbox").attr('id')]
        lightbox.set 'visible', false
      error: (jqXHR, textStatus, errorThrown) =>
        @set 'errors', jqXHR.responseText
      complete: =>
        @set 'submitting', false