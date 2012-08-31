class Thales.Views.CommentsShow extends Backbone.View
  template: JST['comments/show']
      
  render: ->
    $(@el).html(@template(comment: @model))
    #console.log(@model)
    this
    