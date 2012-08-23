class AnswersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json
 
  def index
    @questions = Exercise.find(params[:exercise_id]).questions
    @answers = Array.new()
    @questions.each do |q|
      q.answers.each do |a|
        @answers << a if a.correct==false && @answers.size < 5
      end
    end  
      
    #respond with rabl index
  end

  
  def create
    last = Answer.last # ultima resposta do mesmo usuario e da mesma questao
    #last = Answer.find(user_id: current_user.id, question_id: answer.question_id)
    if (last.response == params[:answer][:response] )
      @answer = last
      respond_with(@answer)
    else 
      respond_with(Answer.create(params[:answer]))
    end
  end
  
  
end
