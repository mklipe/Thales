class Thales.Collections.CommentsCollection extends Backbone.Collection
  url: ->
    '/api/answers/' + this.get('id') + '/comments'
  
  model: Thales.Models.Comment
