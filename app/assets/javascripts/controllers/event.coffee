Whistlr.EventController = Ember.ObjectController.extend
  isExpanded: false

  actions:
    expand: ->
      @set "isExpanded", true

    collapse: ->
      @set "isExpanded", false