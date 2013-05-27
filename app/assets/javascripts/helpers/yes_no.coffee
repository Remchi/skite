Ember.Handlebars.registerBoundHelper 'yesNoBoolean', (boolean) ->
  if boolean
    "Yes"
  else
    "No"