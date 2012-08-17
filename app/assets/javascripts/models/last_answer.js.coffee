class Thales.Models.LastAnswer extends Backbone.RelationalModel
  urlRoot: ->
    '/api/exercises/' + this.get('question').get('exercise').get('id') + '/questions/' + this.get('question').get('id') + '/last_answers' 
           
  relations: [
    type: Backbone.HasOne
    key:  'question'
    relatedModel: 'Thales.Models.Question'
    reverseRelation:
      type: Backbone.HasOne
      key: 'lastanswer'   
    ]
    
Thales.Models.LastAnswer.setup()
