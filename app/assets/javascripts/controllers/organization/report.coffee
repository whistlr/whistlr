Whistlr.OrganizationReportController = Em.ArrayController.extend InfiniteScroll.ControllerMixin,

  sortProperties: ['createdAt']
  sortAscending: false

  itemController: 'report'