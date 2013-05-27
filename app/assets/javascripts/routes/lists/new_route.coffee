Skite.ListsNewRoute = Ember.Route.extend

  setupController: (controller, model) ->
    transaction = @get('store').transaction()
    model = Skite.List.createRecord()
    transaction.add(model)
    controller.set('content', model)