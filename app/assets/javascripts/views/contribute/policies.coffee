Whistlr.ContributePoliciesView = Ember.View.extend(InfiniteScroll.ViewMixin,
  didInsertElement: -> @setupInfiniteScrollListener()
  willDestroyElement: -> @teardownInfiniteScrollListener()
)