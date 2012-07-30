window.Thales =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}

  init: ->
    currentuser = new Thales.Models.Currentuser()
    currentuser.fetch 
      success: () =>
        new Thales.Routers.ExercisesRouter()
        new Thales.Routers.IntroductionsRouter()
        Backbone.history.start({pushState : true})
      error: () => console.log('Precisa logar')

$(document).ready ->
  Thales.init()




