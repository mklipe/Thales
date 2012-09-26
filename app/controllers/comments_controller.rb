class CommentsController < ApplicationController
  respond_to :json

  def index
    @answer = Answer.find(params[:answer_id])
    respond_with(@answer.comments)
  end

  def create
    @answer = Answer.find(params[:answer_id])
    @comment = @answer.comments.create!(params[:comment])
    
    respond_with(@comment)
  end
  
  def destroy 
    @answer = Answer.find(params[:answer_id])
    @comment = @answer.comments.find(params[:id])
    @comment.destroy
    respond_with(@comment)
  end

end
