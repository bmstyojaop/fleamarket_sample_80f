Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'sending_destinations', to: 'users/registrations#new_sending_destination'
    post 'sending_destinations', to: 'users/registrations#create_sending_destination'
  end
  
  root to: "items#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update] do
    resources :sending_destinations, only: [:edit, :update]
  end
  
  # resources :items
  resources :items do
    # resources :comments, only: :create
    collection do
      get 'search'
    end

  resources :items do
    resources :comments, only: [:create, :destroy]

  end
 
end
