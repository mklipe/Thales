class Thales.Views.QuestionsCorrect extends Backbone.View
  tagName: 'div',
  className: 'control-group success'
  template: JST['questions/correct']
  
  render: ->
    $(@el).html(@template(question: @model))
    MathJax.Hub.Queue(["Typeset",MathJax.Hub, @el]);
    this