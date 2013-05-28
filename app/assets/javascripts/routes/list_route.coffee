Skite.ListRoute = Ember.Route.extend

  model: (params) -> Skite.List.find(params.list_id)