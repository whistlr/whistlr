Whistlr.ProductReportController = Em.ArrayController.extend InfiniteScroll.ControllerMixin,

  sortProperties: ['createdAt']
  sortAscending: false

  itemController: 'report'