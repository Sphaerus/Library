class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized
  
  private
  
  def not_authorized
    respond_to do |format|
      if user_signed_in?
        format.html { redirect_to root_path, notice: "You have no permission to do this task" }
      else
        format.html { redirect_to new_user_session_path, notice: "You have to log in first"}
      end  
    end  
  end  
end
