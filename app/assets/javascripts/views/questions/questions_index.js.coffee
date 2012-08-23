class Thales.Views.QuestionsIndex extends Backbone.View

  render: ->
    @model.each(@appendQuestion)
    this

  appendQuestion: (question) =>
    if question.get('last_answer')
      if question.get('last_answer').correct
        view = new Thales.Views.QuestionsCorrect(model: question)
        $('#questions_list').append(view.render().el)
      else
        view = new Thales.Views.QuestionsWrong(model: question)
        $('#questions_list').append(view.render().el)
    else
      view = new Thales.Views.QuestionsShow(model: question)
      $('#questions_list').append(view.render().el)

  
    
