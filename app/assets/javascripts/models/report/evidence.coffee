Whistlr.ReportEvidence = DS.Model.extend
  model: "Report::Evidence"

  citation: DS.attr()
  url: DS.attr()

  _destroy: DS.attr 'boolean', {defaultValue: false}

  reports: DS.hasMany 'report',
    inverse: 'participants'
  upload: DS.belongsTo 'upload'

  previous: DS.belongsTo 'report.evidence',
    inverse: 'next'
  next: DS.belongsTo 'report.evidence',
    inverse: 'previous'

  previousVersion: (->
    @get('previous')
  ).property('previous')

  link: (->
    url = @get "url"
    "<a href='#{url}' target='_blank' class='outgoing-link'></a>"
  ).property('url')