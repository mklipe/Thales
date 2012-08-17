class Thales.Models.Answer extends Backbone.RelationalModel
  urlRoot: ->
    '/api/exercises/' + this.get('question').get('exercise').get('id') + '/questions/' + this.get('question').get('id') + '/answers' 

  toJSON: ->
    answer:
      response: this.get('response')
      user_id: this.get('user_id')
      question_id: this.get('question').get('id')
      
Thales.Models.Answer.setup()