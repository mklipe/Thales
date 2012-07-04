class Thales.Views.IntroductionsShow extends Backbone.View

  template: JST['introductions/introduction']
  
  #className: "span12",
  
  initialize: ->
    @render()
        
  render: ->
    $(@el).html(@template(introduction: @model))
    this