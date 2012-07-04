class Thales.Views.Paginator extends Backbone.View

  className: "pagination pagination-centered"
  
  initialize: ->
    @model.bind "reset", @render, this
    @render()

  render: ->
    items = @model.models
    len = items.length
    pageCount = len
    $(@el).html "<ul></ul>"
    i = 0

    for i in [0...pageCount]
      $("ul", @el).append "<li" + (if (i + 1) is @options.page then " class='active'" else "") + "><a data-page='"+i+"' class='pagination-link'  href='introductions/page/" + (i + 1) + "'>" + (i + 1) + "</a></li>"
      i++
    
    this