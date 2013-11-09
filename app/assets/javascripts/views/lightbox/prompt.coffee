Whistlr.LightboxPromptView = Em.View.extend
  templateName: 'lightbox/prompt'
  classNames: ['ember-lightbox']
  content: ""

  visible: false

  actions:

    setContent: (content) ->
      @set 'visible', true, 1
      @set 'content', content
      @rerender()