Whistlr.lightbox = ->
  Ember.View.views[$(".ember-lightbox").attr('id')]

Whistlr.formTipBox = ->
  Ember.View.views[$(".ember-form-tip-box").attr('id')]

Whistlr.searchBar = ->
  Ember.View.views[$(".ember-search-field").attr('id')]

Whistlr.flash = ->
  Ember.View.views[$(".ember-flash-container").attr('id')]

Whistlr.setFlash = (content, flashType) ->
  flash = Whistlr.flash()
  flash.set('content', content)
  flash.set('flashType', flashType)
  flash.rerender()
  setTimeout("Whistlr.clearFlash()", 30000);

Whistlr.clearFlash = ->
  flash = Whistlr.flash()
  flash.set('content', '')
  flash.set('flashType', '')
  flash.rerender()

Whistlr.showVersionRow = (version, attr) ->
  !version.get('previousVersion') || (version.get(attr) != version.get('previousVersion.'+attr) && version.get('previousVersion.'+attr) != undefined)

Whistlr.addVersionRowProperty = (propertyName) ->
  (->
    Whistlr.showVersionRow this, propertyName
  ).property('previousVersion')

Whistlr.alteredProperties = (originalProperties, newProperties) ->
  alertedProperties = []
  $.each newProperties, (index, value) ->
    alertedProperties.push newProperties[index] if -1 == $.inArray(value, originalProperties)
  return alertedProperties

String::toPath = ->
  newString = @replace /([A-Z])/g, ($1) ->
    "/" + $1.toLowerCase()
  newString.replace(/::/g, '')

String::doterize = ->
  @replace /([A-Z])/g, ($1) ->
    return "." + $1.toLowerCase()