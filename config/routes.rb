Spree::Core::Engine.add_routes do
  # Add your extension routes here
  namespace :admin do
    get "advertisment", to: "advertisments#index", as: :admin_advertisments
    get "advertisments/configuration", to: "advertisments_configurations#configure", as: :advertisments_configurations
    post "advertisments/configuration", to: "advertisments_configurations#configure", as: :advertisments_configurations_update
    resources :advertisments
  end
end
