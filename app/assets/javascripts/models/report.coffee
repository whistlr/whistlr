Whistlr.Report = DS.Model.extend Whistlr.EventableMixin, Whistlr.VersionableMixin, Whistlr.PollableMixin,

  model: "Report"

  versions: DS.hasMany 'report',
    inverse: 'master'
  master: DS.belongsTo 'report',
    inverse: 'versions'

  summary: DS.attr()
  description: DS.attr()
  respondedTo: DS.attr()
  responsesSum: DS.attr()
  responsesApprove: DS.attr()
  responsesDisapprove: DS.attr()
  controversy: DS.attr()
  disinterest: DS.attr()

  participants: DS.hasMany('report.participant', nested: true),
    inverse: 'reports'
  evidence: DS.hasMany('report.evidence', nested: true),
    inverse: 'reports'
  reportable: DS.hasMany 'reportable',
    polymorphic: true

  name: (->
    @get 'summary'
  ).property('summary')

  changedParticipants: (->
    participants = @get 'participants'
    previousVersion = @get 'previousVersion'
    if previousVersion
      return participants
    else
      return participants
  ).property('previousVersion')

  changedEvidence: (->
    evidence = @get 'evidence'
    previousVersion = @get 'previousVersion'
    if previousVersion
      return evidence
    else
      return evidence
  ).property('previousVersion')

  summaryChanged: Whistlr.addVersionRowProperty('summary')
  descriptionChanged: Whistlr.addVersionRowProperty('description')