Skite.ListsIndexController = Ember.ArrayController.extend

  sortProperties: [ 'id' ]

  delete: (list) ->
    return unless confirm "Are you sure?"
    @get('store').transaction().add(list)
    list.deleteRecord()
    list.get('transaction').commit()