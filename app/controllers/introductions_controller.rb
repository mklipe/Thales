class IntroductionsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index] 
  
  def index
    @introductions = Introduction.all.asc(:content)

    respond_to do |format|
      format.json { render json: @introductions }
    end
  end

  def show
    @introduction = Introduction.find(params[:id])

    respond_to do |format|
      format.json { render json: @introduction }
    end
  end 
end
