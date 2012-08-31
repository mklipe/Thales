class Thales.Routers.AnswersRouter extends Backbone.Router
  routes:
    'exercises/page/:page/all_answers': 'showAnswers'

  showAnswers: (page) ->
    