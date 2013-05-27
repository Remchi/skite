Skite.ListsEditRoute = Ember.Route.extend

  model: (params) ->
    Skite.List.find(params.list_id)

  setupController: (controller, model) ->
    @get('store').transaction().add(model)
    controller.set('content', model)