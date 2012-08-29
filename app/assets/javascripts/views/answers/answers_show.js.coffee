class Thales.Views.AnswersShow extends Backbone.View
  template: JST['answers/show']
  tagName: "tr"    
  
  render: ->
    $(@el).html(@template(answer: @model))
    MathJax.Hub.Queue(["Typeset",MathJax.Hub, @el]);
    this