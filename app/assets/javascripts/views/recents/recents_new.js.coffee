class Thales.Views.RecentsNew extends Backbone.View
  template: JST['recents/new']
  className: "recent"
      
  render: ->
    $(@el).html(@template(answer: @model))
    MathJax.Hub.Queue(["Typeset",MathJax.Hub, @el]);
    this
    