Whistlr.Organization = DS.Model.extend Whistlr.EventableMixin, Whistlr.ReportableMixin, Whistlr.VersionableMixin, Whistlr.PollableMixin,

  model: "Organization"
  modelCamelized: "organization"

  versions: DS.hasMany 'organization',
    inverse: 'master'
  master: DS.belongsTo 'organization',
    inverse: 'versions'
    
  city: DS.attr()
  country: DS.attr()
  facebookAlias: DS.attr()
  facebookId: DS.attr()
  name: DS.attr()
  region: DS.attr()
  twitterAlias: DS.attr()
  website: DS.attr()

  children: DS.hasMany 'organization',
    inverse: 'parent'
  parent: DS.belongsTo 'organization',
    inverse: 'children'
  upload: DS.belongsTo 'upload'

  websiteLink: (->
    @websiteLinkGenerator()
  ).property('website')

  websiteLinkIcon: (->
    @websiteLinkGenerator(true)
  ).property('website')

  websiteLinkGenerator: (iconic = false) ->
    website = @get('website')
    classes = if iconic then 'icon contact-link--website' else ''
    text = if iconic then '' else website
    if website? && website != ''
      "<a href='#{website}'' class='#{classes}''>#{text}</a>"

  facebookLink: (->
    @facebookLinkGenerator()
  ).property('facebookAlias', 'facebookId')

  facebookLinkIcon: (->
    @facebookLinkGenerator(true)
  ).property('facebookAlias', 'facebookId')

  facebookLinkGenerator: (iconic = false) ->
    facebookId = @get('facebookId')
    facebookAlias = @get('facebookAlias')
    classes = if iconic then 'icon contact-link--facebook' else ''
    text = if iconic then '' else facebookAlias
    if (facebookId? && facebookId != '') || (facebookAlias? && facebookAlias != '')
      "<a href='http://facebook.com/profile.php?id=#{facebookId}' class='#{classes}'>#{text}</a>"

  twitterLink: (->
    @twitterLinkGenerator()
  ).property('twitterAlias')

  twitterLinkIcon: (->
    @twitterLinkGenerator(true)
  ).property('twitterAlias')

  twitterLinkGenerator: (iconic = false) ->
    twitter = @get('twitterAlias')
    classes = if iconic then 'icon contact-link--twitter' else ''
    text = if iconic then '' else twitter
    if twitter? && twitter != ''
      "<a href='http://www.twitter.com/#{twitter}' class='#{classes}'>#{text}</a>"

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

  image: (->
    if @get('upload')
      "<img class='resource-image' src='#{@get('upload').get('file').url}'></img>"
    else
      "<div class='resource-image resource-image--default-logo'></div>"
  ).property('upload')

  nameChanged: Whistlr.addVersionRowProperty('name')
  parentChanged: Whistlr.addVersionRowProperty('parent')
  uploadChanged: Whistlr.addVersionRowProperty('uplaod')
  countryChanged: Whistlr.addVersionRowProperty('country')
  regionChanged: Whistlr.addVersionRowProperty('region')
  cityChanged: Whistlr.addVersionRowProperty('city')
  facebookAliasChanged: Whistlr.addVersionRowProperty('facebookAlias')
  twitterAliasChanged: Whistlr.addVersionRowProperty('twitterAlias')
  websiteChanged: Whistlr.addVersionRowProperty('website')