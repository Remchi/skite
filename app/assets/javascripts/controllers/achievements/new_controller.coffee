Skite.AchievementsNewController = Ember.Controller.extend

  isValid: (->
    true
  ).property('newAchievement')

  content: null
  input: ""
  errors: ""

  addAchievement: ->
    achievement = @get('content')

    if achievement
      achievement.set('input', @get('input'))
    else
      achievement = Skite.Achievement.createRecord({ input: @get('input')})

    achievement.save()
    @set('content', achievement)

