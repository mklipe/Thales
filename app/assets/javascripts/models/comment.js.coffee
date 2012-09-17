class Thales.Models.Comment extends Backbone.RelationalModel
  
  urlRoot: ->
    '/api/exercises/' + this.get('answer').get('question').get('exercise_id') + '/answers/' + this.get('answer').get('id') + '/comments'
  
  toJSON: ->
    text: this.get('text')
    user_id: this.get('user_id')
    answer_id: this.get('answer').get('id')
      
Thales.Models.Comment.setup()