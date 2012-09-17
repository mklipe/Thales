class Thales.Collections.CommentsCollection extends Backbone.Collection
  
  url: ->
    '/api/exercises/' + this.answer.get('exercise').get('id') + '/answers/' + this.answer.get('id') + '/comments'
  
  model: Thales.Models.Comment
