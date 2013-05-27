Skite.Router.map (match)->
  # match('/').to('index')

  @resource 'achievements', ->
    @route 'new'

  @resource 'achievement', { path: '/achievement/:achievement_id' }

