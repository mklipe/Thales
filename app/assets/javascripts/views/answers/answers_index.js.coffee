class Thales.Views.AnswersIndex extends Backbone.View
  
  #template: JST['answers/index']

  render: ->
    #$(@el).html(@template)
    @model.each(@appendAnswer)
    this

  appendAnswer: (answer) =>
    view = new Thales.Views.AnswersShow(model: answer)
    $('#list_answers').append(view.render().el)
    
  