# For more information see: http://emberjs.com/guides/routing/

Whistlr.Router.map ()->
  @route 'home', path: '/'
  @route 'static.welcome', path: 'welcome'

  @resource 'discuss'

  @resource 'explore', ->
    @resource 'explore.everything', path: 'everything'
    @resource 'explore.organizations', path: 'organizations'
    @resource 'explore.products', path: 'products'
    @resource 'explore.officials', path: 'officials'
  @resource 'workdesk', ->
    @resource 'workdesk.recent_activity', path: 'recent_activity'
    @resource 'workdesk.everything', path: 'everything'
    @resource 'workdesk.organizations', path: 'organizations'
    @resource 'workdesk.products', path: 'products'
    @resource 'workdesk.officials', path: 'officials'

  @resource 'vote'

  @resource 'report', path: 'reports/:report_id', ->
    @route 'main'
    @route 'edit'
    @route 'timeline'

  @resource 'organization', path: 'organizations/:organization_id', ->
    @route 'products'
    @route 'organizations'
    @resource 'organization.officials', path: 'officials', ->
      @resource 'organization.officials.contributee', path: 'contributee', ->
        @route 'new'
        @resource 'organization.officials.contributee.edit', path: ':affiliation_id/edit'
      @resource 'organization.officials.executive', path: 'executive', ->
        @route 'new'
        @resource 'organization.officials.executive.edit', path: ':affiliation_id/edit'
      @resource 'organization.officials.owner', path: 'owner', ->
        @route 'new'
        @resource 'organization.officials.owner.edit', path: ':affiliation_id/edit'
    @route 'edit'
    @route 'timeline'
    @resource 'organization.report', path: 'reports', ->
      @route 'new'
  @route 'organization.new', path: 'organizations/new'

  @resource 'product', path: 'products/:product_id', ->
    @route 'edit'
    @route 'timeline'
    @resource 'product.report', path: 'reports', ->
      @route 'new'
  @route 'product.new', path: 'products/new'

  @resource 'official', path: 'officials/:official_id', ->
    @resource 'official.organizations', path: 'organizations', ->
      @resource 'official.organizations.contributee', path: 'contributee', ->
        @route 'new'
        @resource 'official.organizations.contributee.edit', path: ':affiliation_id/edit'
      @resource 'official.organizations.executive', path: 'executive', ->
        @route 'new'
        @resource 'official.organizations.executive.edit', path: ':affiliation_id/edit'
      @resource 'official.organizations.owner', path: 'owner', ->
        @route 'new'
        @resource 'official.organizations.owner.edit', path: ':affiliation_id/edit'
    @route 'edit'
    @route 'timeline'
    @resource 'official.report', path: 'reports', ->
      @route 'new'
  @route 'official.new', path: 'officials/new'

Whistlr.Router.reopen location: 'history'