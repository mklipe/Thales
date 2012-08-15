class AnswersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json
  
  def create
    last = Answer.last # ultima resposta do mesmo usuario e da mesma questao
    
    if (last.response == params[:answer][:response] )
      @answer = last
      respond_with(@answer)
    else 
      respond_with(Answer.create(params[:answer]))
    end
    
  end
  
end
