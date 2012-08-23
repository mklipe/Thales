class Thales.Models.LastAnswer extends Backbone.RelationalModel
  urlRoot: ->
    '/api/exercises/' + this.get('exercise_id') + '/questions/' + this.get('question_id') + '/last_answers' 
           
Thales.Models.LastAnswer.setup()
