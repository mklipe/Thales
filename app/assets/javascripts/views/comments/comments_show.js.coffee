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
    
    textConfirm = "<h1><i class='icon-warning-sign icon-large bigger pull-right'></i></h1> 
      <p class='bigger'>Deseja mesmo remover este comentário?</p>"
        
    bootbox.confirm textConfirm, "Não", "Sim", (result) =>
      if result
        @model.destroy
          success: =>
            textAlert = "<h1><i class='icon-ok-sign icon-large bigger pull-right'></i></h1>
              <p class='bigger'>Comentário removido!</p>" 
                
            @remove()
            bootbox.alert(textAlert)
    
    
    
    