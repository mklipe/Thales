class Thales.Models.Exercise extends Backbone.RelationalModel
  urlRoot: "/api/exercises/"
  
  relations: [{
    type: Backbone.HasMany
    key: 'questions'
    relatedModel: 'Thales.Models.Question'
    collectionType: 'Thales.Collection.Exercises'
    reverseRelation: {
      key: 'exercise'
      includedInJSON: 'id'
    }
  }]
    
  defaults: 
    "type": 'exercises'

Thales.Models.Exercise.setup()  
 