class Thales.Views.RecentAnswers extends Backbone.View
   
  render: ->
    #$(@el).html(@template(answer: @model))
    @model.each(@appendAnswer)
    this

  appendAnswer: (answer) =>
    view = new Thales.Views.AnswersShow(model: answer)
    $('#answers_list').append(view.render().el)
  