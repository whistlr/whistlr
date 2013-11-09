Whistlr.ResponseButtonComponent = Em.Component.extend

  authToken: ''
  value: ''
  report: null
  respondedTo: null

  respondedToDisapprove: (->
    @get('respondedTo') == -1
  ).property('respondedTo')

  respondedToApprove: (->
    @get('respondedTo') == 1
  ).property('respondedTo')

  actions:
    submit: ->
      Ember.$.ajax
        url: '/responses'
        type: "POST"
        data:
          "auth_token": @get('authToken')
          "response[report_id]": @get 'report.id'
          "response[value]": @get 'value'
        success: (response) =>
          report = @get('report')
          $.each response.report_response, (key, value) ->
            report.set(key.camelize(), value)