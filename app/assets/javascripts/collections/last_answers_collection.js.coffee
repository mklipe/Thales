class Thales.Collections.LastAnswersCollection extends Backbone.Collection

  model: Thales.Models.LastAnswer
  url: ->
    '/api/exercises/' + this.get('question').get('exercise').get('id') + '/questions/' + this.get('question').get('id') + '/last_answers'