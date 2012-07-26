class Thales.Views.QuestionsIndex extends Backbone.View

  render: ->
    @model.each(@appendQuestion)
    this

  appendQuestion: (question) =>
    view = new Thales.Views.QuestionsShow(model: question)
    $('#content').append(view.render().el)

  
    
