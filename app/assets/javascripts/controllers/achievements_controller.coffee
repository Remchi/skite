Skite.AchievementsController = Ember.ArrayController.extend

  sortProperties: [ 'achievedAt' ]
  sortAscending: false

  isValid: (->
    msg = ""
    isValid = true

    str = @get('newAchievement')

    unless str
      isValid = false
      msg += "Field can't be empty. "

    day   = /\bd\d\d\b/.exec(str)
    if day
      if parseInt(day[0].split('d')[1]) > 31
        isValid = false
        msg += "Invalid day. "

    month   = /\bm\d\d\b/.exec(str)
    if month
      if parseInt(month[0].split('m')[1]) > 12
        isValid = false
        msg += "Invalid month. "

    @set('errorMessage', msg)
    isValid
  ).property('newAchievement')

  addAchievement: ->
    data = @parseInput @get('newAchievement')
    Skite.Achievement.createRecord
      title: data['title']
      achievedAt: data['achievedAt']
    @set('newAchievement', '')
    @get('store').commit()

  parseInput: (str) ->
    day   = /\bd\d\d\b/.exec(str)
    month = /\bm\d\d\b/.exec(str)
    year  = /\by\d{4}\b/.exec(str)

    achievedAt = new Date()
    title = str

    if day
      title = title.replace(day[0], "")
      achievedAt.setDate(day[0].split('d')[1])

    if month
      title = title.replace(month[0], "")
      achievedAt.setMonth(parseInt(month[0].split('m')[1]) - 1)

    if year
      title = title.replace(year[0], "")
      achievedAt.setYear(year[0].split('y')[1])

    title.replace(/\s+/, " ") if title

    {
      title: title,
      achievedAt: achievedAt
    }