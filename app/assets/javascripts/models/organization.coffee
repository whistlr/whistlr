Whistlr.Organization = DS.Model.extend Whistlr.EventableMixin, Whistlr.ReportableMixin, Whistlr.VersionableMixin, Whistlr.PollableMixin, Whistlr.SocialMixin, Whistlr.LogoMixin,

  model: "Organization"
  modelCamelized: "organization"

  versions: DS.hasMany 'organization',
    inverse: 'master'
  master: DS.belongsTo 'organization',
    inverse: 'versions'
    
  city: DS.attr()
  country: DS.attr()
  name: DS.attr()
  region: DS.attr()

  children: DS.hasMany 'organization',
    inverse: 'parent'
  parent: DS.belongsTo 'organization',
    inverse: 'children'

  location: (->
    country = @get('country')
    region = @get('region')
    city = @get('city')
    str = ""
    if city? && city != ""
      str += city
      if (region? && region != "") || (country? && country != "")
        str += ", "
    if region? && region != ""
      str += region
      if country? && country != ""
        str += ", "
    if country? && country != ""
      str += country
    str
  ).property('country', 'region', 'city')

  nameChanged: Whistlr.addVersionRowProperty('name')
  parentChanged: Whistlr.addVersionRowProperty('parent')
  countryChanged: Whistlr.addVersionRowProperty('country')
  regionChanged: Whistlr.addVersionRowProperty('region')
  cityChanged: Whistlr.addVersionRowProperty('city')