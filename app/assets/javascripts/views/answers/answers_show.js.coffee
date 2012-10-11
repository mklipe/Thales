class Thales.Views.AnswersShow extends Backbone.View
  template: JST['answers/show']
  tagName: "tr" 
  
  events: ->
    'click .show-comments': 'showComments'
    
  showComments: (ev) ->
    ev.preventDefault()
    view = new Thales.Views.CommentsIndex(model: @model)
    $("#comments").html(view.render().el)
    $("tr").removeClass('selected-row')
    $('#' + @model.get('id')).addClass('selected-row')
    
    
  render: ->
    @el.id = @model.get('id')
    $(@el).html(@template(answer: @model))
    MathJax.Hub.Queue(["Typeset", MathJax.Hub, @el]);
    this