Skite.LoginFormView = Ember.View.extend

  templateName: 'login_form'

  email: null
  password: null
  remember: false
  errorMessage: null

  submit: (event) ->
    event.preventDefault()
    @set('errorMessage', null)
    promise = Skite.Auth.signIn
      email: @get('email')
      password: @get('password')
      remember: @get('remember')

    promise.then => @get('controller').send('signedIn')
    promise.fail (response) =>
      @set('errorMessage', JSON.parse(response.responseText)['errorMessage'])
