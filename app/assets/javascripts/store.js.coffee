Whistlr.ApplicationAdapter = DS.ActiveModelAdapter.extend()

Whistlr.ReportSerializer = DS.ActiveModelSerializer.extend(
  _embedKey: (key) ->
    @keyForAttribute key

  _nestedKey: (key) ->
    @keyForAttribute(key) + "_attributes"

  _serializeRelation: (record, key) ->
    Ember.get(record, key).map ((relation) ->
      data = undefined
      primaryKey = undefined
      data = relation.serialize()
      primaryKey = Ember.get(this, "primaryKey")
      data[primaryKey] = Ember.get(relation, primaryKey)
      data
    ), this

  serializeHasMany: (record, json, relationship) ->
    attrs = undefined
    embed = undefined
    embed_ids = undefined
    key = undefined
    nested = undefined
    key = relationship.key
    attrs = Ember.get(this, "attrs")
    embed = attrs and attrs[key] and attrs[key].embedded is "always"
    nested = relationship.options.nested
    embed_ids = relationship.options.embed is "ids"
    return json[@_embedKey(key)] = @_serializeRelation(record, key)  if embed
    return json[@_nestedKey(key)] = @_serializeRelation(record, key)  if nested
    if embed_ids
      json[@keyForRelationship(key, relationship.kind)] = Ember.get(record, key).map((relation) ->
        relation.get "id"
      , this)
)