class UsersController < ApplicationController

  def show
    @user = User.find(current_user.id)
    respond_to do |format|
      format.json { render json: @user}
    end
  end
  
end