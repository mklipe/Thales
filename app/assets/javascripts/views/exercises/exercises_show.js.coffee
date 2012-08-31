class Thales.Views.ExercisesShow extends Backbone.View

  template: JST['exercises/exercise']
  template2: JST['answers/index']
  
  events: ->
    'click .btn-show': 'showAllAnswers'  
  
  showAllAnswers: (ev) ->
    @changeTemplate()
    @model.get('answers').fetch success: =>
      Backbone.history.navigate('/all_answers/', false)
      view = new Thales.Views.AnswersIndex(model: @model.get('answers'))
      $(@el).append(view.render().el)
      $('table.tablesorter').tablesorter()
      
  changeTemplate: ->
     $('#content').html(@template2)
    
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
