Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  namespace :api do
    get "tasks/index"
    get "hello", to: "hello#index"
    resources :teams, only: [:index, :create, :show, :destroy]
    resources :users
    resources :tasks, only: [:index]
  end
end
