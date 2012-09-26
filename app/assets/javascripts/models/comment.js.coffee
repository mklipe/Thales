class Thales.Models.Comment extends Backbone.RelationalModel
  
  urlRoot: ->
    #console.log(this.get('answer').get('exercise').get('id'), "hello")
    '/api/exercises/' + this.get('answer').get('exercise').get('id') + '/answers/' + this.get('answer').get('id') + '/comments'
  
  toJSON: ->
    text: this.get('text')
    user_id: this.get('user_id')
    answer_id: this.get('answer').get('id')
    user_email: this.get('user_email')
    user_name: this.get('user_name')
    
    
Thales.Models.Comment.setup()