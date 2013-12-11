Whistlr.Affiliation = DS.Model.extend Whistlr.EventableMixin, Whistlr.VersionableMixin, Whistlr.PollableMixin,

  model: "Affiliation"
  modelCamelized: "affiliation"

  versions: DS.hasMany 'affiliation',
    inverse: 'master'
  master: DS.belongsTo 'affiliation',
    inverse: 'versions'

  official: DS.belongsTo 'official',
    inverse: 'relations'
  organization: DS.belongsTo 'organization',
    inverse: 'relations'
  
  title: DS.attr()
  startDate: DS.attr()
  endDate: DS.attr()
  amount: DS.attr()
  shares: DS.attr()
  description: DS.attr()

  dates: (->
    startDate = @get 'startDate'
    endDate = @get 'endDate'
    endDate = if endDate then endDate else "present"
    "#{startDate} - #{endDate}"
  ).property('startDate, endDate')

  amountInDollars: (->
    "$#{@get('amount')}"
  ).property('amount')

  sharesInPercentage: (->
    "#{@get('shares')}%"
  ).property('shares')

  startDateChanged: Whistlr.addVersionRowProperty('startDate')
  endDateChanged: Whistlr.addVersionRowProperty('endDate')
  titleChanged: Whistlr.addVersionRowProperty('title')
  amountChanged: Whistlr.addVersionRowProperty('amount')
  sharesChanged: Whistlr.addVersionRowProperty('shares')
  descriptionChanged: Whistlr.addVersionRowProperty('description')
  officialChanged: Whistlr.addVersionRowProperty('official')
  organizationChanged: Whistlr.addVersionRowProperty('organization')