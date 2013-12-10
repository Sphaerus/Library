Wyszukiwarka::Application.routes.draw do

  resources :books, only: [:create]
  devise_for :users
  resources :users, only: [:index, :edit, :update]
  resources :books
  root 'home#index'

end
