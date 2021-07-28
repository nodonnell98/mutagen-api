Rails.application.routes.draw do
  scope :api, defaults: {format: :json} do
    devise_for :users, controllers: { sessions: :sessions, registrations: :registrations },
                          path_names: { sign_in: :login, sign_out: :logout }
  end

  namespace :api, defaults: { format: :json } do
    resources :weapons, only: [:index, :show, :create, :update, :destroy]
    resources :users, only: %i[show update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
