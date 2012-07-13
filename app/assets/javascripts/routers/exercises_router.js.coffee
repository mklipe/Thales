class Thales.Routers.ExercisesRouter extends Backbone.Router
  routes:
    '': 'list'
    'exercises/page/:page': 'list'
    
    
  list: (page) ->
    page = (if page then parseInt(page, 10) else 1)
    exercises = new Thales.Collections.Exercises()
    
    exercises.fetch 
      success: ->
        $("#content").html new Thales.Views.ExercisesIndex(
          model: exercises
          page: page
        ).el
      error: ->
        console.log('Error Request')  