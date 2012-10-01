class Thales.Views.Paginator extends Backbone.View

  className: "pagination pagination-centered navbar-fixed-bottom bar"
  
  initialize: ->
    @model.bind "reset", @render, this
    @render()
  
  render: ->
    items = @model.models
    
    len = items.length
    pageCount = len
    $(@el).html "<ul></ul>"
    i = 0
    
    href = "/" + items[0].get('type') + "/page/"
    
    for i in [0...pageCount]
      $("ul", @el).append "<li" + (if (i + 1) is @options.page then " class='active'" else "") + ">
        <a rel='tooltip' title='"+items[i].get('title')+"'data-page='"+i+"' 
        class='pagination-link real' href='" + href + "" + (i + 1) + "'>" + (i + 1) + "</a></li>"
      i++ 
    
    if items[0].get('type') == 'exercises' 
      $(@el).addClass("bar-resized")
      $("ul", @el).prepend "<li><a id='introductions' rel='tooltip' title='Introdução' 
        data-page='introdução' class='pagination-link previous' 
        href= '/introductions/page/1' > Introdução </a></li>"  
    else
      $(@el).removeClass("bar-resized")
      $("ul", @el).append "<li><a id='exercises' rel='tooltip' title='Exercícios' 
        data-page='exercícios' class='pagination-link next' 
        href= '/exercises/page/1' > Exercícios </a></li>"            
    
    this