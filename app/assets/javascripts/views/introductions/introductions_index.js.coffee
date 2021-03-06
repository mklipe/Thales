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
    $(ev.currentTarget).parent().siblings().removeClass('active')
    $(ev.currentTarget).parent().addClass('active')
    
    Backbone.history.navigate(href, false)
 
    
  showExercise: (ev) ->
    ev.preventDefault()
    textConfirm = "<h1><i class='icon-warning-sign icon-large bigger pull-right'></i></h1> 
      <p class='bigger'>Ler a introdução é essencial para resolver os exercícios.</p>
      <p class='bigger'>Você já leu e deseja ir para os exercícios?</p>"
        
    bootbox.confirm textConfirm, "Não", "Sim", (result) =>
      if result
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