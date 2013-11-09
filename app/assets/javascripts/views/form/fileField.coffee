Whistlr.FileFieldView = Em.View.extend
  templateName: 'form/fileField'

  didInsertElement: ->
    $('#file_upload').fileupload
      url: "/uploads"
      dataType: "json"
      formData: [{ name: 'auth_token', value: @get('context').auth.get('authToken') }]
      beforeSend: ->
        $(".progress-bar").css "width", "0%"
      success: (response) =>
        upload = @get('parentView').get('controller').store.createRecord('upload', response.upload)
        @get('parentView').get('controller').set('upload', upload)
        $('meta[name="csrf-token"]').attr('content', response.authenticity_token)
      progressall: (e, data) ->
        progress = parseInt(data.loaded / data.total * 100, 10)
        $(".progress-bar").css "width", progress + "%"