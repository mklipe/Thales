class LastAnswersController < ApplicationController
  
=begin  
  def index
    @last = LastAnswer.first(conditions: {user_id: current_user.id, question_id: params[:question_id]})
    #http://localhost:3000/api/exercises/exercicio-2/questions/4ffdfd9b1d41c814e50000f1/last_answers.json
    
    respond_to do |format|
      if (@last)      
        format.json { render json: @last.answer, :only => [:question_id, :correct, :response, :tip, :try_number] }
      else
        format.json { render json: @last}
      end
    end   
  end  
=end
  
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
  
end
