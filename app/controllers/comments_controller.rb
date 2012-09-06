class CommentsController < ApplicationController
  respond_to :json

  def create
    @answer = Answer.find(params[:answer_id])
    @comment = @answer.comments.create!(params[:comment])
    
    respond_with(@comment)
  end
end
