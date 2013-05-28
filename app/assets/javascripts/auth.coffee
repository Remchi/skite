#=require base64

Skite.Auth = Ember.Object.create
  auth_token: null

  signIn: (params) ->
    Ember.$.post('/users/sign_in', params).then (response) =>
      @set('auth_token', response.auth_token)

$.ajaxSetup
  beforeSend: (xhr, options) ->
    if Skite.Auth.get('auth_token')
      encoded_auth_token = Base64.encode64(Skite.Auth.get('auth_token') + ":X")
      header = "Basic #{encoded_auth_token}"
      xhr.setRequestHeader('Authorization', header)