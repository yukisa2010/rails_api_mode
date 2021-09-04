Rails.application.routes.draw do
  resources :customers do
    collection do
      get 'search'
    end
  end
  resources :organizations
end
