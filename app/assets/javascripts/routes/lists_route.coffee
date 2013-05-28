Skite.ListsRoute = Ember.Route.extend

  redirect: -> @transitionTo('login') unless Skite.Auth.get('auth_token')