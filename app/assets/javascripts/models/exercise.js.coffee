class Thales.Models.Exercise extends Backbone.RelationalModel
  urlRoot: "/api/exercises/"

  relations: [{
    type: Backbone.HasMany
    key: 'questions'
    relatedModel: 'Thales.Models.Question'
    collectionType: 'Thales.Collections.QuestionsCollection'
    reverseRelation: {
      key: 'exercise'
    }
  }, 
  {
    type: Backbone.HasMany
    key: 'recents'
    relatedModel: 'Thales.Models.Answer'
    collectionType: 'Thales.Collections.RecentsCollection'
    reverseRelation: {
      key: 'exercise'
    }
  }, 
  {
    type: Backbone.HasMany
    key: 'answers'
    relatedModel: 'Thales.Models.Answer'
    collectionType: 'Thales.Collections.AnswersCollection'
    reverseRelation: {
      key: 'exercise'
    }
  }]

  defaults:
    "type": 'exercises'

Thales.Models.Exercise.setup()
