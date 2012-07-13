class Thales.Views.IntroductionsShow extends Backbone.View

  template: JST['introductions/introduction']
  
  initialize: ->
    @render()
        
  render: ->
    $(@el).html(@template(introduction: @model))
    MathJax.Hub.Queue(["Typeset",MathJax.Hub, @el]);
    this