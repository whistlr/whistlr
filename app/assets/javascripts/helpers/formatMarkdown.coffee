Ember.Handlebars.helper "format-markdown", (input) ->
  if input?
    new Handlebars.SafeString(markdown.makeHtml(input))