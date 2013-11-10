# For more information see: http://emberjs.com/guides/routing/

Whistlr.Router.map ()->
  @route 'home', path: '/'
  @route 'static.welcome', path: 'welcome'

  @resource 'explore', ->
    @resource 'explore.organizations', path: 'organizations'
    @resource 'explore.products', path: 'products'
    @resource 'explore.policies', path: 'policies'
    @resource 'explore.officials', path: 'officials'
  @resource 'engage', ->
    @resource 'engage.organizations', path: 'organizations'
    @resource 'engage.products', path: 'products'
    @resource 'engage.policies', path: 'policies'
    @resource 'engage.officials', path: 'officials'

  @resource 'vote'

  @resource 'organization', path: 'organizations/:organization_id', ->
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

  @resource 'policy', path: 'policies/:policy_id', ->
    @route 'edit'
    @route 'timeline'
    @resource 'policy.report', path: 'reports', ->
      @route 'new'
  @route 'policy.new', path: 'policies/new'

  @resource 'official', path: 'officials/:official_id', ->
    @route 'edit'
    @route 'timeline'
    @resource 'official.report', path: 'reports', ->
      @route 'new'
  @route 'official.new', path: 'officials/new'

Whistlr.Router.reopen location: 'history'