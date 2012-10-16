class Thales.Views.AnswersIndex extends Backbone.View
  template: JST['answers/index']
  
  events: 
    'click .back': 'goBack'
    'click .scroll': 'checkScroll'
    #"scroll": 'checkScroll'
  
  initialize: ->
    _.bindAll(this, 'checkScroll');
    $(window).scroll(@checkScroll);

  render: ->
    $(@el).html(@template(exercise: @model))
    @collection = @model.get('answers')
    @collection.fetch success: =>
      console.log(@collection)
      @collection.each(@appendAnswer)
      $(@el).find('table').tablesorter()   
    this

  appendAnswer: (answer) =>
    view = new Thales.Views.AnswersShow(model: answer)
    $('#list_answers').append(view.render().el)
    
  goBack: (e) ->
    e.preventDefault()
    window.history.back()

  next: ->
    @collection.nextPage()
    @collection.fetch success: =>
      console.log(@collection)
      @collection.each(@appendAnswer)
      $(@el).find('table').tablesorter()

  nearBottomOfPage: () ->
    return (@scroolDistanceFromBottom() < 150)
    
  scroolDistanceFromBottom: (argument) ->
    return @pageHeight() - (window.pageYOffset + self.innerHeight)
    
  pageHeight: ->
    return Math.max(document.body.scrollHeight, document.body.offsetHeight);
  
  checkScroll: ->
    if (@nearBottomOfPage())
      @next()
    else 
      setTimeout("@checkScroll()", 250)
      