class Thales.Collections.QuestionsCollection extends Backbone.Collection

  model: Thales.Models.Question
  url: ->
    '/api/exercises/'+ this.exercise.get('id') + '/questions'
