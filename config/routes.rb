Rails.application.routes.draw do
  devise_for :users, controllers: {
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
  
  resources :credit_cards, only: [:new, :show, :create, :destroy]
  
  resources :items do
    collection do
      get  'confirm/:id'=>  'items#confirm', as: 'confirm'
      post 'pay/:id'=>   'items#pay', as: 'pay'
      get  'done'=>      'items#done', as: 'done'
    end
    resources :items do
      resources :comments, only: [:create, :destroy]
    end
  end
  
  
  
  
  
 
end
