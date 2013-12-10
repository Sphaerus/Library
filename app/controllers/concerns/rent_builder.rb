class RentBuilder
  attr_accessor :status, :rent_card
  
  def initialize(user, params)
    @book = Book.find(params[:book_id])
    @user = user
    @amount = params[:amount].to_i
    @rent_card = RentCard.where(user_id: @user.id, book_id: @book.id).first_or_initialize
    set_rent_card_amount
  end
  
  def rent_books
    unless @book.amount < @amount || @amount == 0
      @book.amount-= @amount
      @rent_card.amount += @amount
      @status = "You have successfully rented #{@book.title}!"
      @correct = true
    else  
      @status = "You can't rent this amount of books"
      @correct = false
    end  
  end
  
  def return_books
    if @amount > @rent_card.amount || @amount == 0
      @status = "Seems like you want to return books you don't have"
      @correct = false
    else  
      @status = "Thank you for returning the books"
      @book.amount+= @amount
      @rent_card.amount-= @amount
      check_rent_card
      @correct = true
    end  
  end
  
  def save!
    if @correct
      @book.save!
      if rent_card_destroyed?
        true
      else
        @rent_card.save!
      end  
    else
      false
    end    
  end
  
  private
  
  def check_rent_card
    if @rent_card.amount == 0
      @rent_card.destroy!
      @rent_card_destroyed = true
    end  
  end
  
  def set_rent_card_amount
    if @rent_card.amount.nil?
      @rent_card.amount = 0
    end  
  end
  
  def rent_card_destroyed?
    @rent_card_destroyed
  end
end