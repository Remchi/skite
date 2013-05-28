Skite.AchievementRoute = Ember.Route.extend

  redirect: -> @transitionTo('login') unless Skite.Auth.get('auth_token')


  setupController: (controller, model) ->
    @get('store').transaction().add(model)
    controller.set('content', model)