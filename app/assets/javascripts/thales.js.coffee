window.Thales =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}

  init: ->
    currentUser = new Thales.Models.Currentuser()
    currentUser.fetch 
      success: () =>
        new Thales.Routers.ExercisesRouter()
        new Thales.Routers.IntroductionsRouter()
        Backbone.history.start({pushState : true})
      error: () => console.log('Precisa logar')

$(document).ready ->
  Thales.init()




