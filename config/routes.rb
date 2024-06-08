Rails.application.routes.draw do
  
  devise_for :users
  
  # Define the root route
  root to: 'homes#index'
  resources :homes, only: [:index]
  resources :profiles, only: [:index, :new, :create, :show, :edit, :update]
  resources :workouts
  resources :nutrition_logs
  resources :goals do
    member do
      post 'log_progress'
    end
  end
  resource :activity_analysis, only: [:show]
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end