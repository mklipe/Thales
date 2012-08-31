class Thales.Views.ModalView extends Backbone.View 
  template: JST['comments/modal']
   
  events: ->
    'click .close': 'close'  
  
  render: ->
    $(@el).html(@template(answer: @model))
    this
  
  show: ->
    $(document.body).append(@render().el)               
  
  close: ->
    this.remove()
       
     