class QuestionsController < ApplicationController

  def index
    @questions = Exercise.find(params[:exercise_id]).questions

    respond_to do |format|
      format.json { render json: @questions } #, :include => :last_answers }
      
    end
  end

  def show
    @question = Question.find(params[:id])

    respond_to do |format|
      format.json { render json: @question } #, :include => :last_answers}
    end
  end

end
