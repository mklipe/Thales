class Thales.Collections.LastAnswersCollection extends Backbone.Collection

  model: Thales.Models.LastAnswer
  url: ->
    '/api/exercises/' + this.question.get('exercise').get('id') + '/questions/' + this.question.get('id') + '/last_answers'