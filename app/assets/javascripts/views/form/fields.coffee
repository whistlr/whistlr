Whistlr.TextField = Em.TextField.extend(Em.I18n.TranslateableAttributes, Whistlr.FormTipMixin,
  attributeBindings: ['accept', 'autocomplete', 'autofocus', 'name', 'required']
)
Whistlr.Checkbox = Em.Checkbox.extend(Whistlr.FormTipMixin)
Whistlr.Select = Em.Select.extend(Whistlr.FormTipMixin)