Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  namespace :api do
    resources :teams, only: [:index, :create, :show, :destroy] do
      resources :tasks, only: [:index, :create, :show, :destroy]
    end
    resources :users
  end
end
