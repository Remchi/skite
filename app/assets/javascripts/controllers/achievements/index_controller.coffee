Skite.AchievementsIndexController = Ember.ArrayController.extend

  sortProperties: ['achievedAt']
  sortAscending: false

  defaultList: (->
    Skite.List.find(1)
  ).property()