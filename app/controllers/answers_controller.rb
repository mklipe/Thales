class AnswersController < ApplicationController
  
  before_filter :authenticate_user!
  
  def create
    @answer = Answer.new(params[:answer])
    
    respond_to do |format|
      if @answer.save
        format.json { render json: @answer, status: :created, location: @answer }
      else
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end
  
end
