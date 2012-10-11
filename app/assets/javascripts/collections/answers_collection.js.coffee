class Thales.Collections.AnswersCollection extends Backbone.Collection
  url: ->
    '/api/exercises/'+ this.exercise.get('id') + '/answers'
    #/page/' + this.page
  
  #page: 1  
  model: Thales.Models.Answer
