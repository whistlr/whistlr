Whistlr.ReportRoute = Ember.Route.extend
  serialize: (model, params) ->
    report_id: model.get('slug')