Whistlr.ReportableMixin = Ember.Mixin.create
  reportParticipations: DS.hasMany 'report.participant',
    inverse: 'reportable'
  reports: DS.hasMany 'report'