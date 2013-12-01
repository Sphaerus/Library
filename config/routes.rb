Wyszukiwarka::Application.routes.draw do

  resources :books, only: [:create]
  root 'home#index'

end
