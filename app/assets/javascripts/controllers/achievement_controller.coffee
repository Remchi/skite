Skite.AchievementController = Ember.ObjectController.extend

  editDescription: false

  showEditDescription: -> @set('editDescription', true)
  hideEditDescription: -> @set('editDescription', false)

  isDescription: (->
    return false unless @get('description')
    !/^\s$/.test(@get('description'))
  ).property('description')

  save: ->
    @hideEditDescription()
    @get('content.transaction').commit()

  delete: ->
    return unless confirm "Are you sure?"
    @get('content').on 'didDelete', @, ->
      @transitionToRoute 'achievements'
    @get('content').deleteRecord()
    @get('content.transaction').commit()