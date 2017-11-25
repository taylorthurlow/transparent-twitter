Rails.application.routes.draw do
  root 'static_pages#home'

  # session
  get 'auth/twitter/callback' => 'sessions#create', as: 'callback'
  get 'auth/failure' => 'sessions#error', as: 'failure'
  get 'profile' => 'sessions#show', as: 'show'
  get 'signout' => 'sessions#destroy', as: 'signout'

  # watson
  get 'analyze/:id' => 'watson#analyze_user', as: 'analyze_user'
  get 'results' => 'static_pages#results', as: 'results'

  # tweets
  resources :tweets, only: [:index, :create, :update, :destroy]
  get 'create_training_data' => 'tweets#create_training_data'
  get 'export_csv' => 'tweets#export_csv'
end
