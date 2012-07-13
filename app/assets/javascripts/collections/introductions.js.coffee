class Thales.Collections.Introductions extends Backbone.Collection

  model: Thales.Models.Introduction
  url: "/api/introductions"
  
  comparator: (introduction) -> 
     introduction.get('content')
  