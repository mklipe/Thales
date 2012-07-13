class Thales.Collections.Exercises extends Backbone.Collection

  model: Thales.Models.Exercise
  url: "/api/exercises"
  
  
  #comparator: (exercise) -> 
     #exercise.get('title')
     
  