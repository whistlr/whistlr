Whistlr.OfficialAutocompleteComponent = Em.Component.extend

  actions:
    setItem: (item, setTo) ->
      child = @get('targetObject')
      child.set(setTo, item)
      child.set(setTo+'Input', item.get('name'))