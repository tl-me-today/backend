Rails.application.routes.draw do
  apipie
  devise_for :users

  root to: "books#index"
  resources :books, :users, :chapters, :book_settings, :volumes
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
