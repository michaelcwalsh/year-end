Rails.application.routes.draw do
  get "/pages/:page" => "pages#show"
  root "pages#show", page: "home"

  devise_for :users
  resources :albums, only: [:show, :new, :create]
  resources :users do
    resources :albums, only: [:index]
  end

  # namespace "/albums#show" do
  #   resources :albums, only: [:create]
  # end
end
