class Thales.Collections.AnswersCollection extends Backbone.Collection 
  
  url: ->
    '/api/exercises/'+ this.exercise.get('id') + '/answers?' + $.param(page: @page)
  
  model: Thales.Models.Answer

  initialize: ->
    @page = 1

  nextPage: ->
    @page = @page + 1
    @fetch()

  previousPage: ->
    @page = @page - 1
    @fetch()
  
  