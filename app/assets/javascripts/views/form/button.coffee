Whistlr.Button = Ember.View.extend

  tagName: 'input'
  classNames: ['btn']
  attributeBindings: ['type', 'value', 'disabled']
  type: 'submit'
  value: Em.I18n.t "shared.submit"
  submitting: false
  disabled: (->
    @submitting
  ).property('submitting')

Whistlr.Button.reopen(Em.I18n.TranslateableAttributes)