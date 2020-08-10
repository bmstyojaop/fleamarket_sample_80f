Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'sending_destinations', to: 'users/registrations#new_sending_destination'
    post 'sending_destinations', to: 'users/registrations#create_sending_destination'
  end
  root to: "items#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: :show
end
