class Thales.Views.AnswersIndex extends Backbone.View

  render: ->
    @model.each(@appendAnswer)
    this

  appendAnswer: (answer) =>
    view = new Thales.Views.AnswersShow(model: answer)
    $('#list_answers').append(view.render().el)
    
  