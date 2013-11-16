Whistlr.FollowButtonComponent = Em.Component.extend

  authToken: ''
  followable: null
  following: (->
    @get('followable.following')
  ).property('followable.following')

  actions:
    submit: ->
      Ember.$.ajax
        url: '/follows'
        type: "POST"
        data:
          "auth_token": @get('authToken')
          "follow[followable_id]": @get 'followable.id'
          "follow[followable_type]": @get 'followable.model'
        success: (response) =>
          followable = @get('followable')
          followable.set 'following', response.follow.following
        error: (response) ->
          Whistlr.setFlash(response.responseJSON["errors"]["base"], 'error')