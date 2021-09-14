Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :customers, only: [:index, :create] do
      get 'search', on: :collection
  end
  resources :organizations, only: [:index, :show, :create, :update]
end
