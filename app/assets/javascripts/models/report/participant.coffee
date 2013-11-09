Whistlr.ReportParticipant = DS.Model.extend

  model: "Report::Participant"

  selectedType: null
  typePromptTranslation: Ember.I18n.t('reports.participants.attributes.reportable_type')

  resourceTypes: [Ember.I18n.t('officials.one'), Ember.I18n.t('organizations.one'), Ember.I18n.t('policies.one'), Ember.I18n.t('products.one')]

  involvement: DS.attr()
  summary: DS.attr()

  name: (->
    @get 'summary'
  ).property('summary')

  reports: DS.hasMany 'report',
    inverse: 'participants'
  reportable: DS.belongsTo 'reportable',
    polymorphic: true

  previous: DS.belongsTo 'report.participant',
    inverse: 'next'
  next: DS.belongsTo 'report.participant',
    inverse: 'previous'

  previousVersion: (->
    @get('previous')
  ).property('previous')

  reportableType: (->
    reportable = @get 'reportable'
    if reportable?
      reportable.get('model')
  ).property('reportable.model')

  reportableInput: (->
    reportable = @get 'reportable'
    if reportable?
      reportable.get('name')
  ).property('reportable.name')

  reportableList: (->
    input = @get 'reportableInput'
    type = @get 'reportableType'
    reportable = @get 'reportable'
    if input? && type? && input.length > 2 && (!reportable? || input != reportable.get('name'))
      @store.findQuery type.camelize(),
        name: @get 'reportableInput'
  ).property('reportableInput')