class Thales.Collections.RecentsCollection extends Backbone.Collection
  url: ->
    '/api/answers/' + this.exercise.get('id') + '/recents'
  
  model: Thales.Models.Answer
