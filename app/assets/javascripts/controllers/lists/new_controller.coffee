Skite.ListsNewController = Ember.ObjectController.extend

  save: ->
    @get('content').on 'didCreate', @, ->
      @transitionToRoute 'lists'
    @get('content.transaction').commit()
