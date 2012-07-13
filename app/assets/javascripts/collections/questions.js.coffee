class Thales.Collections.Questions extends Backbone.Collection

  model: Thales.Models.Question
  url: "/api/questions"
  
  comparator: (question) -> 
     question.get('title')