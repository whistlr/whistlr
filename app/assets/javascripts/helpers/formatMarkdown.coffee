Ember.Handlebars.helper "format-markdown", (input) ->
  return ""  if input is `undefined`
  new Handlebars.SafeString(showdown.makeHtml(input))