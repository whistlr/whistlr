# For more information see: http://emberjs.com/guides/routing/

Whistlr.Router.map ()->
  @route 'home', path: '/'

  @resource 'explore', ->
    @resource 'explore.organizations', path: 'organizations'
  @resource 'engage', ->
    @resource 'engage.organizations', path: 'organizations'

  @resource 'vote'

  @resource 'organization', path: 'organizations/:organization_id', ->
    @route 'edit'
    @route 'timeline'
    @resource 'organization.report', path: 'reports', ->
      @route 'new'
  @route 'organization.new', path: 'organizations/new'

Whistlr.Router.reopen location: 'history'