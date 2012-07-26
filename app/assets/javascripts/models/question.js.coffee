class Thales.Models.Question extends Backbone.RelationalModel
  urlRoot: ->
    '/api/exercises/' + this.get('exercise').get('id') + '/questions'
    
  relations: [{
    type: Backbone.HasMany
    key: 'answers'
    relatedModel: 'Thales.Models.Answer'
    #collectionType: 'Thales.Collections.AnswersCollection'
    reverseRelation: {
      key: 'answer'
    }
  }]  

Thales.Models.Question.setup()
