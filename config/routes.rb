Rails.application.routes.draw do
  get "/pages/:page" => "pages#show"
  root "pages#show", page: "home"

  devise_for :users
  resources :users
  resources :albums
end
