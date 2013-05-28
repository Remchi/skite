Skite.AchievementsRoute = Ember.Route.extend

  redirect: -> @transitionTo('login') unless Skite.Auth.get('auth_token')

  model: -> Skite.Achievement.find()

  renderTemplate: (controller, model) ->
    @render 'achievements'

    filtersController = @controllerFor('filters')
    filtersController.set('content', Skite.List.find())

    @render 'filters',
      into: 'achievements'
      outlet: 'filters'
      controller: filtersController