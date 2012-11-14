class Thales.Views.AnswersIndex extends Backbone.View
  template: JST['answers/index']
  
  events: 
    'click .back': 'goBack'
    'click .just-mine': 'showJustMine'
    'click .search': 'search'
    'submit #search_form' : 'search'
    'keyup #search_form': 'search'
    'reset': 'rerender'
  
  
  initialize: ->
    _.bindAll(this, 'checkScroll');
    $(window).scroll(@checkScroll);

  render: ->
    $(@el).html(@template(exercise: @model))
    @collection = @model.get('answers')
    @collection.search = ""
    @collection.fetch success: =>
      @collection.each(@appendAnswer)
      $(@el).find('table').tablesorter()   
    this

  rerender: ->
    $(@el).find('#list_answers').html('')
    $(@el).find('.alert').remove()
    #$('#new_search').val(@collection.search).focus()
    @collection.fetch
      wait: true
      success: =>
        if @collection.length > 0
          $(@el).find('table').show()
          @collection.each(@appendAnswer)
          $(@el).find('table').tablesorter() 
        else 
          $(@el).find('table').before("<div class='alert'> <button type='button'
          class='close' data-dismiss='alert'>×</button><strong>Aviso!</strong> Nenhum resultado para sua pesquisa </div>")
          $(@el).find('table').hide()
     
        
         
    this

  appendAnswer: (answer) =>
    view = new Thales.Views.AnswersShow(model: answer)
    $('#list_answers').append(view.render().el)
    
  goBack: (e) ->
    e.preventDefault()
    window.history.back()
    
  showJustMine: (e) ->
    e.preventDefault()
    @collection.reset()
    @collection.search = Thales.currentUser.get('name')
    @collection.page = 1
    @rerender()
    
  search: (e) ->
    e.preventDefault()
    @collection.reset()
    @collection.search = $('#new_search').delay(800).val()
    @collection.page = 1
    @rerender()
   
  next: ->
    @collection.nextPage()
    @collection.fetch success: =>
      #console.log(@collection)
      @collection.each(@appendAnswer)
      $(@el).find('table').tablesorter()

  nearBottomOfPage: () ->
    return (@scroolDistanceFromBottom() < 100)
    
  scroolDistanceFromBottom: (argument) ->
    return @pageHeight() - (window.pageYOffset + self.innerHeight)
    
  pageHeight: ->
    return Math.max(document.body.scrollHeight, document.body.offsetHeight);
  
  checkScroll: ->
    if (@nearBottomOfPage())
      @next()
    else 
      setTimeout("@checkScroll()", 250)
      