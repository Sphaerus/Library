class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  
  def index
    @rent_cards = current_user.rent_cards
  end
  
  def show
    @rent_card = RentCard.where(user_id: current_user.id, book_id: @book.id).first_or_initialize
  end
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    respond_to do |format|
      if @book.save
        format.html {redirect_to root_path}
      end
      else
        format.html {redirect_to root_path, notice: "You gave incorrect data"}
      end  
    end      
  end   
  
  def edit
  end
  def update
    respond_to do |format|
      if @book.update_attributes(book_params)
        format.html { redirect_to @book, notice: "#{@book.title} successfully updated" }
      else
        format.html { render action: "edit", notice: "Something went wrong:(" }
      end
    end      
  end
  
  def destroy
    @book.destroy!
    redirect_to root_path, notice: "Book deleted"
  end
  
  private
  
  def book_params
    params.require(:book).permit(:isbn, :title, :author, :publishing_date)
    params.require(:book).permit(:isbn, :title, :author, :publishing_date, :amount)
  end  
  
  def set_book
    @book = Book.find(params[:id])
  end
end  