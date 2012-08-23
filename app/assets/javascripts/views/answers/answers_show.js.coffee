class Thales.Views.AnswersShow extends Backbone.View
  template: JST['answers/show']
  tagName: 'li'
    
  render: ->
    $(@el).html(@template(answer: @model))
    MathJax.Hub.Queue(["Typeset",MathJax.Hub, @el]);
    this
    