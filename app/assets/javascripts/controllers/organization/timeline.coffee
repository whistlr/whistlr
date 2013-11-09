Whistlr.OrganizationTimelineController = Em.ArrayController.extend(
  InfiniteScroll.ControllerMixin

  sortProperties: ['createdAt']
  sortAscending: false

  itemController: 'event'
)