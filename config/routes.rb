Rails.application.routes.draw do
  root 'static_pages#home'

  # static pages
  get 'trainer' => 'static_pages#trainer', format: false

  # tweets
  resources :tweets, only: [:index, :create, :update, :destroy]

end
