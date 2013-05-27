Skite.List = DS.Model.extend

  title: DS.attr 'string'
  public: DS.attr 'boolean'

  achievements: DS.hasMany('Skite.Achievement')

  isRoot: (->
    if parseInt(@get('id')) is 1
      true
    else
      false
  ).property()