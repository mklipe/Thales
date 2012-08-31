class Thales.Views.AnswersShow extends Backbone.View
  template: JST['answers/show']
  tagName: "tr"  
  
  events: ->
    'click .show-comments': 'showComments'
    
  showComments: (ev) ->
    ev.preventDefault()
    view = new Thales.Views.ModalView(answer: @model)
    view.show();
  
  render: ->
    $(@el).html(@template(answer: @model))
    MathJax.Hub.Queue(["Typeset",MathJax.Hub, @el]);
    this