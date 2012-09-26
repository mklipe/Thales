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
  
  def destroy
    @last_answer = LastAnswer.find(params[:id])
    @last_answer.destroy
        
    respond_to do |format|
      format.json { render json: @last_answer }
    end
  end
  
end
