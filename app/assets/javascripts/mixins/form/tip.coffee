Whistlr.FormTipMixin = Ember.Mixin.create
  tip: null

  focusIn: ->
    tipBox = Whistlr.formTipBox()
    if @tip?
      tipBox.set 'content', eval("Whistlr.#{@tip}").create()
      tipBox.rerender()