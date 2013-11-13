Ember.Handlebars.helper "involvementConverter", (participant) ->
  involvement = participant.get('involvement') if participant?
  if involvement?
    output = ""
    for hash in participant.get('involvementTypes') by 1
      output = hash["name"] if hash["value"] == involvement
    new Handlebars.SafeString(output)