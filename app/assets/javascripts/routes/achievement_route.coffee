Skite.AchievementRoute = Ember.Route.extend

  setupController: (controller, model) ->
    @get('store').transaction().add(model)
    controller.set('content', model)