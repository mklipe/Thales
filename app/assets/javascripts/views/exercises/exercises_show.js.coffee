class Thales.Views.ExercisesShow extends Backbone.View

  template: JST['exercises/exercise']
  
  events: ->
    'click .btn-show': 'showAllAnswers'  
  
  showAllAnswers: (ev) ->
    ev.preventDefault()
    Backbone.history.navigate('/exercises/' + @model.get('id') + '/errors', true)
      
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
    @model.get('recents').fetch success: =>
      view = new Thales.Views.RecentsIndex(model: @model.get('recents'))
      $(@el).append(view.render().el)
