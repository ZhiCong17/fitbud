Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  resources :plans do
    resources :exercise_plans
  end
  get 'up' => 'rails/health#show', as: :rails_health_check

  resources :users, only: %i[index update]
  get 'profile', to: 'users#profile'

  # Defines the root path route ("/")
  # root "posts#index"
  post 'plans', to: 'plans#create', as: :create_plan
  resources :plans do
    resources :exercise_plans, only: %i[show]
  end

  resources :exercise_plans do
    resources :trackers, only: %i[create]
  end
end
