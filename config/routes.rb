Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :events, only: [:index, :show]
      resources :tags, only: [:index, :show]
    end
  end
end
