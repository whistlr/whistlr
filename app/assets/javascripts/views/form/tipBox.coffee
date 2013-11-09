Whistlr.FormTipBoxView = Em.View.extend
  templateName: 'form/tipBox'
  classNames: ['ember-form-tip-box']
  content: ""

  actions:

    setContent: (content) ->
      @set 'content', content