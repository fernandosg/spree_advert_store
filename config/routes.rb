Spree::Core::Engine.add_routes do
  # Add your extension routes here
  namespace :admin do
    get "advertisment", to: "advertisments#index", as: :admin_advertisments
    resources :advertisments
    get "advertisment/configuration", to: "advertisments_configuration#configure", as: :admin_advertisments_configuration
    post "advertisment/configuration", to: "advertisments_configuration#configure", as: :admin_advertisments_configuration_update
  end
end
