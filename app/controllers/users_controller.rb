class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  
  def index 
    @users = User.all
    authorize @users
  end
  
  def edit
    authorize @user
  end
  
  def update
    authorize @user
    respond_to do |format|
      if @user.update_attributes!(user_params)
        format.html { redirect_to :users, notice: "Users account updated" }
      else
        format.html { render action: "edit", notice: "Users account update failed"}
      end
    end      
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:admin)
  end
end