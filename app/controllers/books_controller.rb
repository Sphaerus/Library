class BooksController < ApplicationController
  
  def create
    @book = Book.new(book_params)
    respond_to do |format|
      if @book.save
        format.html {redirect_to root_path}
      end
    end      
  end   
  
  private
  
  def book_params
    params.require(:book).permit(:isbn, :title, :author, :publishing_date)
  end  
end  