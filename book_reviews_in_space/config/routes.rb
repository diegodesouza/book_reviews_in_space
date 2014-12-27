Rails.application.routes.draw do
  get 'books/index'

  devise_for :users, :controllers => {:registrations => "registrations"}

  root 'books#index'

  resources :books do
    resources :reviews
  end
end
