class Thales.Views.RecentsIndex extends Backbone.View
  render: ->
    @model.each(@appendAnswer)
    @appendButton()
    this

  appendAnswer: (answer) =>
    view = new Thales.Views.RecentsShow(model: answer)
    $('#answers_list').append(view.render().el)
    
  appendButton: ->
    $('#answers_list').append("<hr/><div><button class='btn btn-primary btn-show'>Ver Todas</button></div>")
  