class Thales.Views.CommentsShow extends Backbone.View
  template: JST['comments/show']
    
  events: 
    'click .remove-comment': 'removeComment' 
      
  render: ->
    $(@el).append(@template(comment: @model))
    MathJax.Hub.Queue(["Typeset", MathJax.Hub, @el]);
    this
    
  removeComment: (event) ->
    event.preventDefault()
    
    if confirm "Deseja mesmo remover este comentário?"
      @model.destroy
        success: =>
          @remove()
          alert("Commentário removido!")
          #bootbox.js
    