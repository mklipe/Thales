class ExercisesController < ApplicationController

  def index
    @exercises = Exercise.all.asc(:title)

    respond_to do |format|
      format.json { render json: @exercises }
    end
  end

  def show
    @exercise = Exercise.find(params[:id])

    respond_to do |format|
      format.json { render json: @exercise }
    end
  end
end
