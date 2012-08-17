class Thales.Models.Question extends Backbone.RelationalModel
  urlRoot: ->
    '/api/exercises/' + this.get('exercise').get('id') + '/questions'
    
  relations: [{
    type: Backbone.HasMany
    key: 'answers'
    relatedModel: 'Thales.Models.Answer'
    reverseRelation: {
      key: 'question'
    }
  }, {
    type: Backbone.HasOne
    key: 'lastanswer'
    relatedModel: 'Thales.Models.LastAnswer'
    reverseRelation: {
      type: Backbone.HasOne
      key: 'question'
    }
  }]  

Thales.Models.Question.setup()
