class Thales.Views.ExercisesShow extends Backbone.View
      
  template: JST['exercises/exercise']
  
  events: ->
    'click .btn-show': 'showAllAnswers'  
    'click .btn-restart' : 'restartExercise'
  
  initialize: ->
    #PrivatePub.sign({"server":"http://localhost:9292/faye","timestamp":1348239802966,"channel":"/messages/new","signature":"fa62aabef717a7dd5c5a92caf6fa4b3d7b8a674a"})
    PrivatePub.sign(@model.get('private_pub'))
    PrivatePub.subscribe "/exercises/"+@model.id, (answer, channel) ->
      console.log(answer)
      
    console.log("/exercises/"+@model.id);
  
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
      
  restartExercise: () ->
    if confirm "Deseja mesmo recomeçar este exercício?"
      @model.get('questions').each(@deleteLastAnswer)
      @render()

  deleteLastAnswer: (question) => 
    if question.get('last_answer')
      lastAnswer = new Thales.Models.LastAnswer(exercise: @model, id: question.get('last_answer').id)
      lastAnswer.destroy
        wait: true 
        success: ->
          question.unset('last_answer')
          console.log("destruido")
        error: ->
          console.log("Errooou")
    
