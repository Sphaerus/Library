class BookPolicy < ApplicationPolicy
  
  def index?
    user_present?
  end
  
  def show?
    user_present?
  end
  
  def new?
    create?
  end
  
  def create?
    admin?
  end  
  
  def edit?
    admin?
  end
  
  def update?
    edit?
  end
  
  def destroy?
    admin?
  end      
  
end