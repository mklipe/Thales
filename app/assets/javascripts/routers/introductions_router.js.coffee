class Thales.Routers.IntroductionsRouter extends Backbone.Router
  routes:
    '': 'list'
    'introductions/page/:page': 'list'
    
    
  list: (page) ->
    console.log(page)
    page = (if page then parseInt(page, 10) else 1)
    console.log(page)   
    introductions = new Thales.Collections.Introductions()
    console.log(introductions)
    introductions.fetch 
      success: ->
        $("#content").html new Thales.Views.IntroductionsIndex(
          model: introductions
          page: page
        ).el
      error: ->
        console.log('request error oooo')  

