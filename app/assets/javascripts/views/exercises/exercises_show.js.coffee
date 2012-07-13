class Thales.Views.ExercisesShow extends Backbone.View

  template: JST['exercises/exercise']
  
  render: ->
    $(@el).html(@template(exercise: @model))
    console.log(@model)
   # @showQuestions()
    MathJax.Hub.Queue(["Typeset",MathJax.Hub, @el]);
    this
    
  #showQuestions: () ->
   # do (@model) ->
    #  console.log(@model)
     # @model.questions.fetch success: ->
      #  view = new Thales.Views.QuestionsIndex(model: @model)
       # $(@el).append(view.render().el)
    