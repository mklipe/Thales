class Thales.Collections.LastAnswersCollection extends Backbone.Collection
  model: Thales.Models.LastAnswer
  
  url: ->
    console.log(@)
    '/api/exercises/' + this.get('exercise').get('id') + '/last_answers'