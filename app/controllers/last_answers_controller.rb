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
  
  #def show
   # @last_answers = User.find(current_user.id).last_answers 
    #respond_to do |format|
     # format.json { render json: @last_answers } 
  #  end
  #end
  
  def index
    
    @last = LastAnswer.where(user_id: current_user.id).and(question_id: params[:question_id]).first
    #http://localhost:3000/api/exercises/exercicio-2/questions/4ffdfd9b1d41c814e50000f1/last_answers.json
    
    respond_to do |format|
      format.json { render json: @last.answer, :only => [:question_id, :correct, :response, :tip, :try_number] }
    end   
  end
  
end