class Thales.Collections.RecentsCollection extends Backbone.Collection
  url: ->
    '/api/answers/' + this.exercise.get('id') + '/recents'
    #'/api/exercises/'+ this.exercise.get('id') + '/answers' 
  
  model: Thales.Models.Answer
