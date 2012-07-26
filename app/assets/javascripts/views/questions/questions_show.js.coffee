class Thales.Views.QuestionsShow extends Backbone.View

  template: JST['questions/question']
  
  render: ->
    $(@el).html(@template(question: @model))
   
    MathJax.Hub.Queue(["Typeset",MathJax.Hub, @el]);
    this
  
  events: ->
    'click .btn': 'show'
  
  show: (e) ->
    e.preventDefault()
    
    answer = new Thales.Models.Answer()
    
    attributes =
      user_id : '5008c0ff1d41c80995000003'
      response: e.srcElement.form.answer.value
      question: @model
    
    
    answer.save attributes,
      success: (model, response) ->
        if model.get('correct')
          console.log('acertou')
        else
          console.log('errou')
          
        console.log(model, ' Success')     
      error: ->
        console.log(answer, ' Error ')