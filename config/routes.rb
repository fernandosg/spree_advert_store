Spree::Core::Engine.add_routes do
  # Add your extension routes here
  namespace :admin do
    get "advertisment", to: "advertisments#index", as: :admin_advertisments
    resources :advertisments
  end
end
