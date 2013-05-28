#=require base64

Auth = Ember.Object.extend
  auth_token: null

  signedIn: (->
    @get('auth_token')
  ).property('auth_token')

  signIn: (params) ->
    Ember.$.post('/users/sign_in', params).then (response) =>
      @set('auth_token', response.auth_token)

  signOut: ->
    promise = Ember.$.ajax '/users/sign_out',
      type: 'DELETE'

    promise.then =>
      @set('auth_token', null)

    promise

Skite.Auth = Auth.create()

$.ajaxSetup
  beforeSend: (xhr, options) ->
    if Skite.Auth.get('auth_token')
      encoded_auth_token = Base64.encode64(Skite.Auth.get('auth_token') + ":X")
      header = "Basic #{encoded_auth_token}"
      xhr.setRequestHeader('Authorization', header)
  error: (xhr) ->
    window.location = '/#/login' if xhr.status is 401