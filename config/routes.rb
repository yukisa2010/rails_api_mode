Rails.application.routes.draw do
  resources :customers, only: [:index, :create] do
    collection do
      get 'search'
    end
  end
  resources :organizations, only: [:index, :show, :create, :update]
end
