Whistlr.ExploreOfficialsView = Ember.View.extend(InfiniteScroll.ViewMixin,
  didInsertElement: -> @setupInfiniteScrollListener()
  willDestroyElement: -> @teardownInfiniteScrollListener()
)