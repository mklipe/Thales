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
    
    currentUser.fetch success: () =>
      answer.save ({response: e.srcElement.form.answer.value, question: @model, user_id: currentuser.get('id')}),
      success: (model, response) ->
        if model.get('correct')
          console.log('acertou')
        else
          console.log('errou')   
      error: ->
        console.log(answer, ' Error ')