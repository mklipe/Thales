class Thales.Views.IntroductionsIndex extends Backbone.View

  initialize: ->
    @render()
 
  events: ->
    'click .pagination-link.next': 'showExercise'
    'click .pagination-link.real': 'showIntroduction'

  showIntroduction: (ev) ->
    ev.preventDefault()
    href = $(ev.currentTarget).attr('href')
    page = $(ev.currentTarget).data('page')
    
    $($(@el).children()[0]).replaceWith(new Thales.Views.IntroductionsShow(model: @model.models[page]).render().el )
    
    Backbone.history.navigate(href, false)
 
    
  showExercise: (ev) ->
    ev.preventDefault()
    console.log(ev,'oi')
    Backbone.history.navigate('/exercises/page/1', true)
  
    
  render: ->
    introductions = @model.models
    len = introductions.length

    $(@el).append(new Thales.Views.IntroductionsShow(model: introductions[@options.page-1]).render().el )
    
    $(@el).append new Thales.Views.Paginator(
      model: @model
      page: @options.page
    ).render().el
    this