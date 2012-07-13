class Thales.Views.ExercisesShow extends Backbone.View

  template: JST['exercises/exercise']

  render: ->
    $(@el).html(@template(exercise: @model))
    @showQuestions()
    MathJax.Hub.Queue(["Typeset",MathJax.Hub, @el])
    this

  initialize: ->


  showQuestions: () ->
    @model.get('questions').fetch success: =>
      view = new Thales.Views.QuestionsIndex(model: @model.get('questions'))
      $(@el).append(view.render().el)

