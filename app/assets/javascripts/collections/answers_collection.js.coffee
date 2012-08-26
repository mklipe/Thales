class Thales.Collections.AnswersCollection extends Backbone.Collection
  url: ->
    '/api/exercises/'+ this.exercise.get('id') + '/answers' 
  
  model: Thales.Models.Answer
