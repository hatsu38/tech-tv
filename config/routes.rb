Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "events#index"
  resources :healthcheck, only: [:index]
  resources :events, only: [:index, :show]
  resources :newly_events, only: [:index]
  resources :tags, only: [:index, :show]
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

  get '/sitemap' => redirect("https://s3-ap-northeast-1.amazonaws.com/#{ENV['S3_BUCKET_NAME']}/sitemap.xml.gz")
  get "*anything" => "application#rescue_404"
end
