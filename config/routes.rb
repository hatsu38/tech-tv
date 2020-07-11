Rails.application.routes.draw do
  root to: "events#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :events, only: [:index, :show]
      resources :tags, only: [:index, :show]
      namespace :ranking do
        resources :tags, only: [:index]
      end
    end
  end
end
