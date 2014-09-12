Rails.application.routes.draw do
  resources :sites, except: [:new, :edit]

  match "*path", to: "sites#index", via: "get"

  root 'sites#index'
end
