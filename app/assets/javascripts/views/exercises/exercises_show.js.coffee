class Thales.Views.ExercisesShow extends Backbone.View

  template: JST['exercises/exercise']

  render: ->
    $(@el).html(@template(exercise: @model))
    @showQuestions()
    @showRecentAnswers()
    MathJax.Hub.Queue(["Typeset", MathJax.Hub, @el])
    this

  showQuestions: () ->
    @model.get('questions').fetch success: =>
      view = new Thales.Views.QuestionsIndex(model: @model.get('questions'))
      $(@el).append(view.render().el)

  showRecentAnswers: () ->
    @model.get('answers').fetch success: =>
      view = new Thales.Views.RecentsIndex(model: @model.get('answers'))
      $(@el).append(view.render().el)
