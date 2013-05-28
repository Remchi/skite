Skite.ListRoute = Ember.Route.extend

  redirect: -> @transitionTo('login') unless Skite.Auth.get('auth_token')

  model: (params) -> Skite.List.find(params.list_id)