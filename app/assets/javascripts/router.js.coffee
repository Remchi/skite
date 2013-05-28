Skite.Router.map (match)->
  # match('/').to('index')

  @resource 'achievements', ->
    @resource 'list', { path: '/list/:list_id' }, ->
      @route 'new'

  @resource 'achievement', { path: '/achievement/:achievement_id' }

  @resource 'lists', ->
    @route 'new'
    @route 'edit', { path: '/edit/:list_id'}
    @route 'show', { path: '/:list_id' }

  @route 'login'
  @route 'logout'