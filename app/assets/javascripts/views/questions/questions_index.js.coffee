class Thales.Views.QuestionsIndex extends Backbone.View

  render: ->
    @model.each(@appendQuestion)
    this

  appendQuestion: (question) =>
    view = new Thales.Views.QuestionsShow(model: question)
    $('#questions_list').append(view.render().el)

  
    
