Skite.List = DS.Model.extend

  title: DS.attr 'string'
  public: DS.attr 'boolean'

  achievements: DS.hasMany('Skite.Achievement')

  achievementsCount: (->
    @get('achievements.length')
  ).property('achievements.@each')

  isRoot: (->
    if parseInt(@get('id')) is 1
      true
    else
      false
  ).property()