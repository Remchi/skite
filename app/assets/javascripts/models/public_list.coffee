Skite.PublicList = DS.Model.extend

  title: DS.attr 'string'
  public: DS.attr 'boolean'

  achievements: DS.hasMany('Skite.Achievement')