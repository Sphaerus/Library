class UserPolicy < ApplicationPolicy
  
  def index?
    admin?
  end
  
  def edit?
    admin?
  end
  
  def update?
    edit?
  end      
  
end