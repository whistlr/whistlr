Ember.Handlebars.helper "eventPartial", (name, options) ->
  name = "events/#{name.toPath()}"
  Ember.Handlebars.helpers.partial.apply this, arguments