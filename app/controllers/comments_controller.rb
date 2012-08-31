class CommentsController < ApplicationController
  def create
    @answer = Answer.find(params[:answer_id])
    @comment = @answer.comments.create!(params[:comment])
    
    #redirect_to @answer, :notice => "Comment created!"
  end
end
