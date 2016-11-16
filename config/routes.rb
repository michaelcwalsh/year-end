Rails.application.routes.draw do
  get "/pages/:page" => "pages#show"
  root "pages#show", page: "home"

  devise_for :users
  resources :albums, only: [:show, :new, :create]
  resources :users, only: [:show] do
    resources :albums, only: [:index]
  end
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end
