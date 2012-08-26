class Thales.Views.QuestionsShow extends Backbone.View
  tagName: 'div',
  className: 'control-group'
  template: JST['questions/question']
  
  render: ->
    $(@el).html(@template(question: @model))
    MathJax.Hub.Queue(["Typeset",MathJax.Hub, @el]);
    this
    
  events: ->
    'click .btn': 'sendAnswer'
    'submit' : 'sendAnswer'
  
  sendAnswer: (e) ->
    e.preventDefault()
    
    answer = new Thales.Models.Answer()
    if (e.srcElement.form.answer.value) 
      console.log('Digite algum valor')
    answer.save ({response: e.srcElement.form.answer.value, question: @model, user_id: Thales.currentUser.get('id')}),
      success: (model, response) ->
        if model.get('correct')
          $(e.delegateTarget).removeClass('error')
          $(e.delegateTarget).addClass('success')
          $("span#" + model.get('question').get('id')).html("<span class='label label-success'>Resposta correta, Parabéns!</span>")
          $(e.srcElement.form.answer).prop('disabled', true)
          $(e.srcElement).hide()
        else
          $("span#" + model.get('question').get('id')).html("<span class='label label-important'>Resposta errada, Tente novamente!</span><div class='alert alert-error nopadding'>Tentativas: " + model.get('try_number') + "<br />Dica: " + model.get('tip') + "</div>")
          $(e.delegateTarget).removeClass('success')
          $(e.delegateTarget).addClass('error')
          $(e.srcElement).removeClass('padd')
                                    
      error: (obj, resp) ->
        result = $.parseJSON(resp.responseText)
        alert result.error
        