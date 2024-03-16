Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/")
  # root "posts#index"
  resources :books do
    resources :roteiros, only: [:show, :new, :create, :destroy] do
      resources :reviews, only: [:new, :create, :show, :edit, :update, :destroy]
    end
    post 'favorites', to: 'favorites#create'
  end
  get 'favorites', to: 'favorites#index'
  delete 'favorites/:id', to: 'favorites#destroy', as: :favorite

  # resources :roteiros do
  #   member do
  #     post 'add_to_favorites'
  #   end
  # end

# new review
#  get 'books/:book_id/roteiros/:roteiro_id/reviews/new', to: 'reviews#new', as: :new_review

  resources :roteiros, only: [:index, :edit, :update]
end
