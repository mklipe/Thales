class Thales.Views.ExercisesIndex extends Backbone.View

  initialize: ->
    @render()
 
  events: ->
    'click .pagination-link.previous': 'showIntroduction'
    'click .pagination-link.real': 'showExercise'
      
  showIntroduction: (ev) ->
    ev.preventDefault()
    Backbone.history.navigate('/introductions/page/1', true)
  
  showExercise: (ev) ->
    ev.preventDefault()
    href = $(ev.currentTarget).attr('href')
    page = $(ev.currentTarget).data('page')
    
    $($(@el).children()[0]).replaceWith(new Thales.Views.ExercisesShow(model: @model.models[page]).render().el )
    
    $(ev.currentTarget).parent().siblings().removeClass('active')
    $(ev.currentTarget).parent().addClass('active')
    
    Backbone.history.navigate(href, false)
    
  render: ->
    exercises = @model.models
    len = exercises.length

    $(@el).append(new Thales.Views.ExercisesShow(model: exercises[@options.page-1]).render().el )
    
    $(@el).append new Thales.Views.Paginator(
      model: @model
      page: @options.page
    ).render().el
    this