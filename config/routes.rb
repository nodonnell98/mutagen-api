Rails.application.routes.draw do
  devise_for :users
  resources :weapons, only: [:index, :show, :create, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/weapons", to: "weapons#index"
  get "/weapons/:id", to: "weapons#show"
  post "/weapons", to: "weapons#create"
  put "weapons/:id", to: "weapons#update"
  delete "weapons/:id", to: "weapons#destroy"
end
