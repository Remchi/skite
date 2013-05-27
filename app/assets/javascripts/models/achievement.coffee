Skite.Achievement = DS.Model.extend

  title: DS.attr 'string'
  achievedAt: DS.attr 'date'
  input: DS.attr 'string'

  validate: ->
    msg = { title: [] }
    isValid = true

    str = @get('input')

    unless str
      isValid = false
      msg['title'].push "Field can't be empty. "

    day   = /\bd\d\d\b/.exec(str)
    if day
      if parseInt(day[0].split('d')[1]) > 31
        isValid = false
        msg['title'].push "Invalid day. "

    month   = /\bm\d\d\b/.exec(str)
    if month
      if parseInt(month[0].split('m')[1]) > 12
        isValid = false
        msg['title'].push "Invalid month. "

    @set('errors', msg)

    if isValid is false and @get('isValid')
      @get('stateManager').send('becameInvalid')
    if isValid and @get('isValid') is false
      @get('stateManager').send('becameValid')

    isValid

  parseInput: ->
    str = @get('input')
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

    @set('title', title)
    @set('achievedAt', achievedAt)