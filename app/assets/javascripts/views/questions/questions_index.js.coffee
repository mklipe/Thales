class Thales.Views.QuestionsIndex extends Backbone.View
  
  render: ->
    @model.questions.each(@appendQuestion)
    this
  
  appendQuestion: (question) =>
    if @model.get('id') == question.get('exercise_id')
      view = new Thales.Views.QuestionsShow(model: question)
      $('#content').append(view.render().el)