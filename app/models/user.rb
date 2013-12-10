class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :recoverable,
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable
  
  has_many :rent_cards
  has_many :books, through: :rent_cards
  
  def has_book?(book)
    books.include?(book)
  end  
end
