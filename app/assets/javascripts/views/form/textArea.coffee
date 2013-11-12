Whistlr.TextArea = Em.View.extend Whistlr.FormTipMixin,
  templateName: 'form/textArea'

  buttonBarId: ""
  inputId: ""
  placeholder: ""
  placeholderTranslation: ""
  value: null

  random: 0

  init: ->
    @set('random', Math.floor(Math.random() * (999999 - 100000 + 1)) + 100000)
    @set('buttonBarId', 'wmd-button-bar-' + @get('random'))
    @set('inputId', 'wmd-input-' + @get('random'))
    @set('placeholder', Em.I18n.t(@get 'placeholderTranslation'))
    @_super()

  didInsertElement: ->
    editor = new Markdown.Editor(markdown, '-'+ @get('random'))
    editor.run()