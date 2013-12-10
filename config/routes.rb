Wyszukiwarka::Application.routes.draw do

  devise_for :users
  resources :users, only: [:index, :edit, :update]
  resources :books
  root 'home#index'
  resources :rent_cards, except: [:show, :index, :new, :edit] do 
    patch "return_books"
  end

end
