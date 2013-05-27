Skite.AchievementsNewController = Ember.Controller.extend

  isValid: (->
    true
  ).property('newAchievement')

  addAchievement: ->
    data = @parseInput @get('newAchievement')
    Skite.Achievement.createRecord
      title: data['title']
      achievedAt: data['achievedAt']
    @set('newAchievement', '')
    @get('store').commit()

