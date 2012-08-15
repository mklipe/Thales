class LastAnswersController < ApplicationController
    
  def create
    @last_answer = LastAnswer.new(params[:question, :user])
    
    respond_to do |format|
      if @last_answer.save
        format.json { render json: @last_answer, status: :created, location: @last_answer }
      else
        format.json { render json: @last_answer.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @last_answers = Exercise.find(params[:exercise_id]).questions.last_answers
    respond_to do |format|
      format.json { render json: @last_answers } 
    end
  end
  
  def index
    @last = User.find(current_user.id).last_answers
    
    respond_to do |format|
      format.json { render json: @last}
    end
  end
  
  
end
