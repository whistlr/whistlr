Whistlr.User  = DS.Model.extend Whistlr.FollowableMixin,
  name: DS.attr()
  email: DS.attr()
  archivistReputation: DS.attr()
  whistlrReputation: DS.attr()