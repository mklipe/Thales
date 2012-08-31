class Thales.Models.Comment extends Backbone.RelationalModel
  urlRoot: ->
    '/api/answers/' + this.get('id') + '/comments'
  
  toJSON: ->
    comment:
      text: this.get('text')
      user_id: this.get('user_id')
      answer_id: this.get('answer').get('id')
      
Thales.Models.Comment.setup()