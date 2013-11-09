Whistlr.ReportEvidence = DS.Model.extend
  model: "Report::Evidence"

  citation: DS.attr()
  url: DS.attr()

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