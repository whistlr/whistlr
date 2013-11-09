Whistlr.lightbox = ->
  Ember.View.views[$(".ember-lightbox").attr('id')]

Whistlr.formTipBox = ->
  Ember.View.views[$(".ember-form-tip-box").attr('id')]

Whistlr.showVersionRow = (version, attr) ->
  !version.get('previousVersion') || (version.get(attr) != version.get('previousVersion.'+attr) && version.get('previousVersion.'+attr) != undefined)

Whistlr.addVersionRowProperty = (propertyName) ->
  (->
    Whistlr.showVersionRow this, propertyName
  ).property('previousVersion')

String::toPath = ->
  @replace /([A-Z])/g, ($1) ->
    "/" + $1.toLowerCase()
  @replace(/::/g, '/')

String::doterize = ->
  @replace /([A-Z])/g, ($1) ->
    return "." + $1.toLowerCase()