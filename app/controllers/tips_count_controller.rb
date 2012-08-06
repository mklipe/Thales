class TipsCountController < ApplicationController
    
  def create
    @tips_count = TipsCount.new(params[:user, :question])
    
    respond_to do |format|
      if @tips_count.save
        format.json { render json: @tips_count, status: :created, location: @tips_count }
      else
        format.json { render json: @tips_count.errors, status: :unprocessable_entity }
      end
    end
  end
  
end
