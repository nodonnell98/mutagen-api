Rails.application.routes.draw do
  resources :weapons, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/weapons", to: "weapons#index"
end
