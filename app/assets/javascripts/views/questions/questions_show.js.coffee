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
    currentuser = new Thales.Models.Currentuser()
    currentuser.fetch success: () =>
      answer.save ({response: e.srcElement.form.answer.value, question: @model, user_id: currentuser.get('id')}),
      success: (model, response) ->
        if model.get('correct')
          console.log('Acertou')
          $(e.delegateTarget).removeClass('error')
          $(e.delegateTarget).addClass('success')
               
        else
          console.log('Errou')
          $(e.delegateTarget).removeClass('success')
          $(e.delegateTarget).addClass('error')
                          
      error: ->
        console.log(answer, ' Error ')