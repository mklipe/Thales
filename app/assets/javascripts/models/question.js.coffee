class Thales.Models.Question extends Backbone.RelationalModel
  urlRoot: ->
    '/api/exercises/' + this.get('exercise').get('id') + '/questions'

Thales.Models.Question.setup()
