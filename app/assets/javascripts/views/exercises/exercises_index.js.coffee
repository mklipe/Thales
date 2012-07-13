class Thales.Views.ExercisesIndex extends Backbone.View

  initialize: ->
    @render()
 
  events: ->
    'click .pagination-link': 'showExercise'

  showExercise: (ev) ->
    ev.preventDefault()
    href = $(ev.currentTarget).attr('href')
    page = $(ev.currentTarget).data('page')
    
    $($(@el).children()[0]).replaceWith(new Thales.Views.ExercisesShow(model: @model.models[page]).render().el )
    
    Backbone.history.navigate(href, true)
    
  render: ->
    exercises = @model.models
    len = exercises.length

    $(@el).append(new Thales.Views.ExercisesShow(model: exercises[@options.page-1]).render().el )
    
    $(@el).append new Thales.Views.Paginator(
      model: @model
      page: @options.page
    ).render().el
    this