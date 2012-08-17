class Thales.Views.QuestionsIndex extends Backbone.View

  render: ->
    @model.each(@appendQuestion)
    this

  appendQuestion: (question) =>
    $.ajax '/api/exercises/' + question.get('exercise').get('id') + '/questions/' + question.get('id') + '/last_answers',
      type: 'GET'
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log(data)

    #console.log(question.get('lastanswer'))
    #question.get('lastanswer').fetch sucess: =>
    console.log(question)
    view = new Thales.Views.QuestionsShow(model: question)
    $('#questions_list').append(view.render().el)

  
    
