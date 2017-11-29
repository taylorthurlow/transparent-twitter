Rails.application.routes.draw do
  root 'static_pages#home'

  # session
  get 'auth/twitter/callback' => 'sessions#create', as: 'callback'
  get 'auth/failure' => 'sessions#error', as: 'failure'
  get 'profile' => 'sessions#show', as: 'show'
  get 'signout' => 'sessions#destroy', as: 'signout'

  # user
  resources 'users', only: [:create, :update, :destroy]
  get 'reindex_friends' => 'users#reindex_friends'

  # twitter_users
  resources 'twitter_users', only: [:create, :update, :destroy]

  # watson
  get 'analyze' => 'watson#analyze_user', as: 'analyze_user'
  get 'results' => 'static_pages#results', as: 'results'
end
