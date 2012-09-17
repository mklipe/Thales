class Thales.Views.AnswersIndex extends Backbone.View
  template: JST['answers/index']

  events: 
    'click .back': 'goBack'
  
  render: ->
    $(@el).html(@template(exercise: @model))
    @model.get('answers').fetch success: =>
      @model.get('answers').each(@appendAnswer)
      $(@el).find('table').tablesorter()   
    this

  appendAnswer: (answer) =>
    view = new Thales.Views.AnswersShow(model: answer)
    $('#list_answers').append(view.render().el)
    
  goBack: (e) ->
    e.preventDefault()
    window.history.back()