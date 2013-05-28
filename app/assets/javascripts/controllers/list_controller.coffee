Skite.ListController = Ember.ObjectController.extend

  listAchievements: (->
    Ember.ArrayProxy.createWithMixins Ember.SortableMixin,
      content: @get('content.achievements')
      sortProperties: ['achievedAt']
      sortAscending: false
  ).property('content')