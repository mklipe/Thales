class Thales.Views.AnswersIndex extends Backbone.View
  template: JST['answers/index']

  events: 
    'click .back': 'goBack'
#    'click .scroll': 'checkScroll'
# on template: <button class="scroll btn btn-block btn-info">Ver mais respostas...</button>
  
#  initialize: ->
#    this.isLoading = false
#    this.myCollection = new Thales.Collections.AnswersCollection()
  
  render: ->
    $(@el).html(@template(exercise: @model))
#    myCollection = @model.get('answers')
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

#  loadResults: ->
#    that = this
#    @isLoading = true
#    
#    @myCollection.fetch success: =>
#      @model.get('answers').each(@appendAnswer)
#      $(@el).find('table').tablesorter()   
#      
#    that.isLoading = false

#  checkScroll: ->
#    console.log("Hello check!")
#    @myCollection.page += 1 
#    @loadResults()
