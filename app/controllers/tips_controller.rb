class TipsController < ApplicationController
  def index
    @tips = Question.find(params[:question_id]).tips

    respond_to do |format|
      format.json { render json: @tips }
    end
  end

  def show
    @tip = Tip.find(params[:id])

    respond_to do |format|
      format.json { render json: @tip }
    end
  end

end
