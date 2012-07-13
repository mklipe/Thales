class Thales.Views.Paginator extends Backbone.View

  className: "pagination pagination-centered navbar-fixed-bottom"
  
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
      $("ul", @el).append "<li" + (if (i + 1) is @options.page then " class='active'" else "") + "><a data-page='"+i+"' class='pagination-link'  href='" + href + "" + (i + 1) + "'>" + (i + 1) + "</a></li>"
      i++ 
                   
    this