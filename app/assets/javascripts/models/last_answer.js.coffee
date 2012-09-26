class Thales.Models.LastAnswer extends Backbone.RelationalModel
  urlRoot: ->
    '/api/exercises/' + this.get('exercise').get('id') + '/last_answers'
           
Thales.Models.LastAnswer.setup()
