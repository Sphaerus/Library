class RentCardsController < ApplicationController
  before_action :set_book
  
  def create
    @rent_builder = RentBuilder.new(current_user, rent_card_params)
    @rent_builder.rent_books
    authorize @rent_builder.rent_card
    
    respond_to do |format|
      if @rent_builder.save!
        format.html { redirect_to @book, notice: @rent_builder.status }
      else
        format.html { redirect_to @book, notice: @rent_builder.status}  
      end
    end    
  end
  
  def update
    @rent_builder = RentBuilder.new(current_user, rent_card_params)
    @rent_builder.rent_books
    authorize @rent_builder.rent_card
    
    respond_to do |format|
      if @rent_builder.save!
        format.html { redirect_to @book, notice: @rent_builder.status}
      else
        format.html { redirect_to @book, notice: @rent_builder.status}  
      end
    end 
  end
  
  def return_books
    @rent_builder = RentBuilder.new(current_user, rent_card_params)
    authorize @rent_builder.rent_card
    @rent_builder.return_books
    
    respond_to do |format|
      if @rent_builder.save!
        format.html { redirect_to @book, notice: @rent_builder.status}
      else
        format.html { redirect_to @book, notice: @rent_builder.status}  
      end
    end  
  end
  
  private
  
  def set_book
    @book = Book.find(rent_card_params[:book_id])
  end 
  
  def rent_card_params
    params.require(:rent_card).permit(:user_id, :book_id, :amount)
  end 
end