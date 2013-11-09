Whistlr.VoteButtonComponent = Em.Component.extend

  authToken: ''
  voteableType: ''
  voteableId: ''
  value: ''
  votedFor: null

  votedNay: (->
    @get('votedFor') == -1
  ).property('votedFor')

  votedYea: (->
    @get('votedFor') == 1
  ).property('votedFor')

  actions:
    submit: ->
      Ember.$.ajax
        url: '/votes'
        type: "POST"
        data:
          "auth_token": @get('authToken')
          "vote[voteable_type]": @get 'voteableType'
          "vote[voteable_id]": @get 'voteableId'
          "vote[value]": @get 'value'
        success: (response) =>
          store = _this.get('parentView.parentView.targetObject.store')
          store.find(response.voteable.voteableType, response.voteable.voteableId).then (voteable) ->
            $.each response.voteable, (key, value) ->
              voteable.get('pollAttributes').set(key.camelize(), value)