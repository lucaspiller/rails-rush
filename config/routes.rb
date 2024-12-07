Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "dashboard#index"

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  scope "/users" do
  end

  scope "/:account_slug" do
    root "dashboard#index", as: :dashboard

    resource :account, only: [:edit, :update]

    resource :account_settings, only: [] do
      resource :general, controller: "account_settings/general", only: [:edit, :update]
      resource :site, controller: "account_settings/site", only: [:edit, :update]
    end
  end
end
