Skite.AchievementsRoute = Ember.Route.extend

  model: -> Skite.Achievement.find()

  renderTemplate: (controller, model) ->
    @render 'achievements'

    filtersController = @controllerFor('filters')
    filtersController.set('content', Skite.List.find())

    @render 'filters',
      into: 'achievements'
      outlet: 'filters'
      controller: filtersController