class RentCardPolicy < ApplicationPolicy
  
  def create?
    user_present?
  end  
  
  def update?
    user_present?
  end
  
  def return_books?
    user_present?
  end    
end