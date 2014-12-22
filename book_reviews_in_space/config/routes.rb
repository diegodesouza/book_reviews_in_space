Rails.application.routes.draw do
  get 'books/index'

  devise_for :users

  root 'books#index'

  resources :books do
    resources :reviews
  end
end
