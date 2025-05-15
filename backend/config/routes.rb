Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  namespace :api do
    get "hello", to: "hello#index"
    resources :teams, only: [:index, :create, :show, :destroy]
    resources :users
  end
end
