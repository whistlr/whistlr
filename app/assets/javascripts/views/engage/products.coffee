Whistlr.EngageProductsView = Ember.View.extend(InfiniteScroll.ViewMixin,
  didInsertElement: -> @setupInfiniteScrollListener()
  willDestroyElement: -> @teardownInfiniteScrollListener()
)