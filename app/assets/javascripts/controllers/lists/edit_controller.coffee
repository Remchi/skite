Skite.ListsEditController = Ember.ObjectController.extend

  save: ->
    @get('content').on 'didUpdate', @, ->
      @transitionToRoute 'lists'
    @get('content.transaction').commit()
