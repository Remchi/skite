Skite.IndexRoute = Ember.Route.extend

  model: -> Skite.PublicList.find()