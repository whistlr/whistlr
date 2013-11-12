Whistlr.FormTipMixin = Ember.Mixin.create
  tip: null

  focusIn: ->
    tipBox = Whistlr.formTipBox()
    if @tip?
      tipBox.set 'content', markdown.makeHtml(Em.I18n.t(@tip))
      tipBox.rerender()