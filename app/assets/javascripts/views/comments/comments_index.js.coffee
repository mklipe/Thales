class Thales.Views.CommentsIndex extends Backbone.View
  template: JST['comments/index']
  className: 'fixed-scrollable' 
  
  events: 
    'submit #new_comment_form' : 'createComment'
    'keyup #new_comment_form': 'createComment'      
      
  render: ->
    $(@el).html(@template)
    
    @model.get('comments').fetch
      success: => 
        @model.get('comments').each(@appendComment)
        @model.get('comments').on('add', @appendComment)
        
    this
  
  appendComment: (comment) =>
    console.log(comment)
    view = new Thales.Views.CommentsShow(model: comment)
    $(@$el).find('#comments_list').prepend(view.render().el)
        
  createComment: (e) ->
    e.preventDefault()
    return if e.keyCode != 13
    
    attributes = {
      text: $('#new_comment_text').val()
      answer: @model
      user: Thales.currentUser
    } 
    
    @model.get('comments').create attributes,
      wait: true
      success: -> 
        $('#new_comment_form')[0].reset()
        
      error: @handleError
    this
       
  handleError: (comment, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages   
        