window.Thales =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  
  init: ->
    new Thales.Routers.IntroductionsRouter()
    Backbone.history.start({pushState : true})

$(document).ready ->
  Thales.init()


  

