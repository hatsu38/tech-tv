Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "events#index"
  resources :healthcheck, only: [:index]
  resources :events, only: [:index, :show]
  resources :newly_events, only: [:index]
  resources :tags, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :healthcheck, only: [:index]
      resources :events, only: [:index, :show]
      resources :newly_events, only: [:index]
      resources :tags, only: [:index, :show]
      namespace :ranking do
        resources :tags, only: [:index]
      end
    end
  end

  get "*anything" => "application#rescue_404"
end
