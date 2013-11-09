Whistlr.PolicyReportController = Em.ArrayController.extend InfiniteScroll.ControllerMixin,

  sortProperties: ['createdAt']
  sortAscending: false

  itemController: 'report'