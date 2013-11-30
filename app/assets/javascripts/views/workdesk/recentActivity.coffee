Whistlr.WorkdeskRecentActivityView = Ember.View.extend(InfiniteScroll.ViewMixin,
  templateName: "workdesk/recentActivity"
  didInsertElement: -> @setupInfiniteScrollListener()
  willDestroyElement: -> @teardownInfiniteScrollListener()
)