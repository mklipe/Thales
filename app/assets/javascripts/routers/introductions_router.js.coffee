class Thales.Routers.IntroductionsRouter extends Backbone.Router
  routes:
    '': 'list'
    'introductions/page/:page': 'list'
    
    
  list: (page) ->
    page = (if page then parseInt(page, 10) else 1)
    introductions = new Thales.Collections.Introductions()
    introductions.fetch 
      success: ->
        $("#content").html new Thales.Views.IntroductionsIndex(
          model: introductions
          page: page
        ).el
      error: ->
        console.log('Error IntroductionsRouter')  

