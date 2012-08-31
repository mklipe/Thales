class Thales.Routers.AnswersRouter extends Backbone.Router
  routes:
    'exercises/:exercise/errors': 'showErrors'

  showErrors: (exercise) ->
    exer = new Thales.Models.Exercise
      id: exercise
    
    exer.fetch success: =>
      view = new Thales.Views.AnswersIndex(model: exer)
      $('#content').html(view.render().el)
    