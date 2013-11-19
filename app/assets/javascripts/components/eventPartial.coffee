Whistlr.EventPartialComponent = Em.Component.extend

  event: ""

  partialPath: (->
    "events#{@get('event.eventable.type').toPath()}"
  ).property('event.eventable.type')