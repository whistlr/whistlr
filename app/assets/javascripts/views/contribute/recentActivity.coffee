Whistlr.ContributeRecentActivityView = Ember.View.extend(InfiniteScroll.ViewMixin,
  templateName: "contribute/recentActivity"
  didInsertElement: -> @setupInfiniteScrollListener()
  willDestroyElement: -> @teardownInfiniteScrollListener()
)