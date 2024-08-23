Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items
  resources :products, only: [:index, :new]

end



