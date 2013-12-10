class Book < ActiveRecord::Base
  validates :title, :author, :publishing_date, :isbn, presence: true
  has_many :rent_cards
  
  def self.browse(query)
    self.where("title REGEXP :query OR author REGEXP :query OR publishing_date REGEXP :query OR isbn REGEXP :query", query: query) 
  end  
  
  def available?
    self.amount > 0 
  end
end
