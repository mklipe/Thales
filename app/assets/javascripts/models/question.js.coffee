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
  },
  {
    type: Backbone.HasMany
    key: 'tips'
    relatedModel: 'Thales.Models.Tip'
    #collectionType: 'Thales.Collections.TipsCollection'
    reverseRelation: {
      key: 'tip'
    }
  }]  

Thales.Models.Question.setup()
