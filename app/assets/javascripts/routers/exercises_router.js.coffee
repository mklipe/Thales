class Thales.Routers.ExercisesRouter extends Backbone.Router
  routes:
    '': 'list'
    'exercises/page/:page': 'list'


  list: (page) ->
    page = (if page then parseInt(page, 10) else 1)
    exercises = new Thales.Collections.ExercisesCollection()

    exercises.fetch
      success: ->
        $("#content").addClass('span9')
        $("#content").html new Thales.Views.ExercisesIndex(
          model: exercises
          page: page
        ).el
      error: ->
        console.log('Error Request')