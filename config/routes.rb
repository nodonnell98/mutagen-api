Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    scope :v1 do
      devise_for :users, controllers: { sessions: :sessions, registrations: :registrations },
                         path_names: { sign_in: :login, sign_out: :logout }
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :characters
      resources :weapons, only: %i[index show create update destroy post]
      resources :users, only: %i[show update]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
