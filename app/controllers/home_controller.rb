class HomeController < ApplicationController
  def index
    @books = Book.browse(params[:search])
    
    respond_to do |format|
      format.html
      format.json { render json: @books }
    end
  end  
end  