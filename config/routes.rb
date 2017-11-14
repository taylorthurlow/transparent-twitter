Rails.application.routes.draw do
  root 'static_pages#home'

  # static pages
  get 'trainer' => 'static_pages#trainer', format: false

  # tweets
  resources :tweets, only: [:index, :create, :update, :destroy]
  get 'create_training_data' => 'tweets#create_training_data'
  get 'export_csv' => 'tweets#export_csv'

  # watson
  post 'create_classifier' => 'watson#create_classifier'
end
