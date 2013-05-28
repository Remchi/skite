Skite.ListItemsView = Ember.View.extend

  templateName: 'list_items'

  sortedAchviements: (->
    Ember.ArrayProxy.createWithMixins Ember.SortableMixin,
      content: @get('content')
      sortProperties: ['achievedAt']
      sortAscending: false
  ).property('content')