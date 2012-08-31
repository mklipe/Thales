class Thales.Views.CommentsIndex extends Backbone.View
  render: ->
    @model.each(@appendComment)
    this

  appendComment: (comment) =>
    view = new Thales.Views.CommentsShow(model: comment)
    $('#comments_list').append(view.render().el)
