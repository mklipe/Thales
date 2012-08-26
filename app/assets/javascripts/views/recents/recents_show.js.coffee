class Thales.Views.RecentsShow extends Backbone.View
  template: JST['recents/show']
      
  render: ->
    $(@el).html(@template(answer: @model))
    #console.log(@model)
    MathJax.Hub.Queue(["Typeset",MathJax.Hub, @el]);
    this
    