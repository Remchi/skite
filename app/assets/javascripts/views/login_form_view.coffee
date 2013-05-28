Skite.LoginFormView = Ember.View.extend

  templateName: 'login_form'

  email: null
  password: null

  submit: (event) ->
    event.preventDefault()
    console.log "login"