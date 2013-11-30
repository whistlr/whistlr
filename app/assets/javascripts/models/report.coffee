Whistlr.Report = DS.Model.extend Whistlr.EventableMixin, Whistlr.VersionableMixin, Whistlr.PollableMixin, Whistlr.SluggableMixin,

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

  participantsAltered: (->
    changedParticipants = @get "changedParticipants"
    removedParticipants = @get "removedParticipants"
    changedParticipants || removedParticipants
  ).property("changedParticipants, removedParticipants")

  changedParticipants: (->
    participants = @get 'participants.content'
    previousParticipants = @get 'previousVersion.participants.content'
    alteredParticpants = Whistlr.alteredProperties previousParticipants, participants
    if alteredParticpants
      return alteredParticpants
    else
      return false
  ).property('previousVersion')

  removedParticipants: (->
    participants = @get 'participants.content'
    previousParticipants = @get 'previousVersion.participants.content'
    alteredParticpants = Whistlr.removedProperties previousParticipants, participants
    if alteredParticpants
      return alteredParticpants
    else
      return false
  ).property('previousVersion')

  evidenceAltered: (->
    changedEvidence = @get "changedEvidence"
    removedEvidence = @get "removedEvidence"
    changedEvidence || removedEvidence
  ).property("changedEvidence, removedEvidence")

  changedEvidence: (->
    evidence = @get 'evidence.content'
    previousEvidence = @get 'previousVersion.evidence.content'
    alteredEvidence = Whistlr.alteredProperties previousEvidence, evidence
    if alteredEvidence
      return alteredEvidence
    else
      return false
  ).property('previousVersion')

  removedEvidence: (->
    evidence = @get 'evidence.content'
    previousEvidence = @get 'previousVersion.evidence.content'
    alteredEvidence = Whistlr.removedProperties previousEvidence, evidence
    if alteredEvidence
      return alteredEvidence
    else
      return false
  ).property('previousVersion')

  reportChanged: (->
    @get('summaryChanged') || @get('descriptionChanged')
  ).property('summaryChanged, descriptionChanged')

  summaryChanged: Whistlr.addVersionRowProperty('summary')
  descriptionChanged: Whistlr.addVersionRowProperty('description')