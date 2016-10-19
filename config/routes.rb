Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :movies

  get "/pages/:page" => "pages#show"
  root "pages#show", page: "home"
end
