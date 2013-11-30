Whistlr.WorkdeskRecentActivityController = Em.ArrayController.extend(
  InfiniteScroll.ControllerMixin

  itemController: 'organization'

  itemController: 'event'

  eventsPresent: (->
    @get('content').length > 0
  ).property('content.length')
)