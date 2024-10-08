Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check


  post "login", to: "session#login"
  get "accounts", to: "accounts#index"

  post "transactions/transfer", to: "transactions#transfer"
  get "transactions", to: "transactions#index"
  get "transactions/:id", to: "transactions#show"
  get "mutations/:account_id", to: "transactions#mutations"
  # Defines the root path route ("/")
  # root "posts#index"
end
