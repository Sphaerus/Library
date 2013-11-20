class Book < ActiveRecord::Base
  
  def self.browse(query)
    if query.nil? || query.blank?
      nil
    else
      self.where("title REGEXP :query OR author REGEXP :query OR publishing_date REGEXP :query OR isbn REGEXP :query", query: query) 
    end  
  end  
end
