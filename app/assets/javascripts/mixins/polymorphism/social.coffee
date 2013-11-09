Whistlr.SocialMixin = Ember.Mixin.create
  twitterAlias: DS.attr()
  website: DS.attr()
  facebookAlias: DS.attr()
  facebookId: DS.attr()

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
      
  facebookAliasChanged: Whistlr.addVersionRowProperty('facebookAlias')
  twitterAliasChanged: Whistlr.addVersionRowProperty('twitterAlias')
  websiteChanged: Whistlr.addVersionRowProperty('website')