Skite.LoginRoute = Ember.Route.extend

  events:
    signedIn: -> @transitionTo('achievements')