Rails.application.routes.draw do
  root 'static_pages#home'

  # session
  get 'auth/twitter/callback' => 'sessions#create', as: 'callback'
  get 'auth/failure' => 'sessions#error', as: 'failure'
  get 'profile' => 'sessions#show', as: 'show'
  get 'signout' => 'sessions#destroy', as: 'signout'

  # user
  get 'reindex_friends' => 'users#reindex_friends'

  # watson
  get 'analyze/:id' => 'watson#analyze_user', as: 'analyze_user'
  get 'results' => 'static_pages#results', as: 'results'
end
