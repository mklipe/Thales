class AnswersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json
 
  def index
    @answers = Answer.wrong(params[:exercise_id]).by_user_name(params[:search]).paginate(:page => params[:page], :per_page => 12)
  end
  
  def just_mine
    @answers = Answer.wrong(params[:exercise_id]).by_user(current_user).paginate(:page => params[:page], :per_page => 12)
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
      if !@answer.correct
        PrivatePub.publish_to("/exercises/#{params[:exercise_id]}" , answer: @answer.as_json(:include => [ :question, :user ]))
        #only question.title and user.name
      end
      respond_with(@answer)
    end
  end
  
end
