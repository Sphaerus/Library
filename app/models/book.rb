class Book < ActiveRecord::Base
  
  def self.browse(query)
    self.where("title REGEXP :query OR author REGEXP :query OR publishing_date REGEXP :query OR isbn REGEXP :query", query: query) 
  end  
end
