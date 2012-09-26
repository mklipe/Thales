class AnswersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json
 
  def index
    @answers = Answer.wrong(params[:exercise_id])
  end
  
  def recents
    @answers = Answer.wrong(params[:exercise_id]).limit(5)
  end
  
  def create
    last = LastAnswer.first(conditions: {user_id: current_user.id, question_id: params[:question_id]})
    
    if (last && (last.answer.response == params[:answer][:response]) )
      @answer = last.answer
      #Answer.new(params[:answer])
      respond_with(@answer)
    else 
      @answer = Answer.create(params[:answer])
      puts "-------------"
      p params[:exercise_id]
      PrivatePub.publish_to("/exercises/#{params[:exercise_id]}" , answer: @answer)
      
      respond_with(@answer)
    end
  end
  
end
