ApplicationController: Ember.Controller.extend
    updateCurrentPath: (->
        Whistlr.set('currentPath', @get('currentPath'))
    ).observes('currentPath')