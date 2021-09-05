Rails.application.routes.draw do
  resources :customers, only: [:index, :create] do
      get 'search', on: :collection
  end
  resources :organizations, only: [:index, :show, :create, :update]
end
