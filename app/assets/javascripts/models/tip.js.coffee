class Thales.Models.Tip extends Backbone.RelationalModel
  urlRoot: ->
    '/api/exercises/' + this.get('exercise').get('id') + '/questions'
    

Thales.Models.Tip.setup()
