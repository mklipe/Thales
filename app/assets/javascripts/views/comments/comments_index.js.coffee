class Thales.Views.CommentsIndex extends Backbone.View
  template: JST['comments/index']
   
  events: 
    'submit #new_comment_form' : 'createComment'
    'keyup #new_comment_form': 'createComment'
    'click .remove-comment': 'removeComment'
        
  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @appendComment, this)
      
  render: ->
    $(@el).html(@template)
    @collection.each(@appendComment)
    this
  
  appendComment: (comment) =>
    console.log(comment)
    view = new Thales.Views.CommentsShow(model: comment)
    @$el.append(view.render().el)
    
  appendNew: (comment) =>
    @$el.append(comment.get('text'))  
    
  createComment: (e) ->
    e.preventDefault()
    return if e.keyCode != 13
    
    attributes = {
      text: $('#new_comment_text').val()
      #user: Thales.currentUser.get('email')
    } 
    @collection.create attributes,
      #wait: true
      success: -> 
        $('#new_comment_form')[0].reset()
        alert("Comentário criado com sucesso!")
      error: @handleError
      
  removeComment: (event) ->
    event.preventDefault()
    console.dir(event.target.id)
    @collection.get(event.target.id).destroy()
    @collection.trigger('reset')
       
  handleError: (comment, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages   
        