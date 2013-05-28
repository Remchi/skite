#=require base64

Auth = Ember.Object.extend
  auth_token: null

  init: ->
    if $.cookie('remember_token')
      promise = Ember.$.ajax '/users/sign_in',
        type: "POST"
        data:
          remember_token: $.cookie('remember_token')
        dataType: "JSON"
        async: false

      promise.then (response) =>
        @set('auth_token', response.auth_token)

  signedIn: (->
    @get('auth_token')
  ).property('auth_token')

  signIn: (params) ->
    Ember.$.post('/users/sign_in', params).then (response) =>
      @set('auth_token', response.auth_token)
      if response.remember_token
        $.cookie('remember_token', response.remember_token, { expires: 1 })

  signOut: ->
    promise = Ember.$.ajax '/users/sign_out',
      type: 'DELETE'

    promise.then =>
      @set('auth_token', null)
      $.removeCookie('remember_token') if $.cookie('remember_token')

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