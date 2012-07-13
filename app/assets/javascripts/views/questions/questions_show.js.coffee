class Thales.Views.QuestionsShow extends Backbone.View

  template: JST['questions/question']
  
  render: ->
    $(@el).html(@template(question: @model))
   
    MathJax.Hub.Queue(["Typeset",MathJax.Hub, @el]);
    this