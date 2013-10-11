Wyszukiwarka::Application.routes.draw do

  resources :books, only: [:update, :create, :destroy]
  root 'home#index'

end
