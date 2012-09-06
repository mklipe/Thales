class Thales.Views.CommentsShow extends Backbone.View
  template: JST['comments/show']
    
  render: ->
    $(@el).append(@template(comment: @model))
    MathJax.Hub.Queue(["Typeset", MathJax.Hub, @el]);
    this