Rails.application.routes.draw do
  get "farms/new", to: "farms#new"
  post "farms", to: "farms#create"
  get "farms/:id/edit", to: "farms#edit"
  patch "restaurants/:id", to: "restaurants#update"
  delete "restaurants/:id", to: "restaurants#destroy"

  devise_for :users
  root to: 'pages#home'
  resources :farms, only: [:index, :show, :new, :create, :destroy ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
