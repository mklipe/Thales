class Thales.Views.CommentsIndex extends Backbone.View
  template: JST['comments/index']
   
  events: 
    'submit #new_comment_form' : 'createComment'
    'keyup #new_comment_form': 'createComment'      
      
  render: ->
    $(@el).html(@template)
    @model.get('comments').fetch
      success: => 
        if @model.get('comments').length > 0
          $(@$el).find('#inform').remove()
        else 
          $(@$el).find('#inform').html("<br /><p class='bigger'><i class='icon-info-sign'></i> 
            Não há nenhum comentário para esta resposta.
            Seja o primeiro a comentar!
            </p>")
        @model.get('comments').each(@appendComment)
        @model.get('comments').on('add', @appendComment)
        
    this
  
  appendComment: (comment) =>
    $(@$el).find('#inform').remove()
    view = new Thales.Views.CommentsShow(model: comment)
    $(@$el).find('#comments_list').prepend(view.render().el)
    $('#new_comment_text').focus()
        
  createComment: (e) ->
    e.preventDefault()
    return if e.keyCode != 13
    
    attributes = {
      text: $('#new_comment_text').val()
      answer: @model
      user: Thales.currentUser
      user_name: Thales.currentUser.get('name')
      user_email: Thales.currentUser.get('email')
    } 
   
    @model.get('comments').create attributes,
      wait: true
      success: -> 
        $('#new_comment_form').find('input').attr('value', '')    
      error: @handleError
    this
       
    
  handleError: (comment, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages   
        