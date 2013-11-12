Ember.Handlebars.helper "format-markdown", (input) ->
  if input?
    new Handlebars.SafeString(markdown.makeHtml(input))

Ember.Handlebars.helper "formatMarkdownTranslation", (input) ->
  if input?
    new Handlebars.SafeString(markdown.makeHtml(Em.I18n.t(input)))