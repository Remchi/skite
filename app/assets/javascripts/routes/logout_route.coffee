Skite.LogoutRoute = Ember.Route.extend

  activate: ->
    Skite.Auth.signOut().then => @transitionTo('login')