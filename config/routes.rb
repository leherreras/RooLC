Rails.application.routes.draw do
  get 'passwords/edit'
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :topics
    end
  end

  mount_devise_token_auth_for 'User', at: 'api/v1', controllers: {
    registrations: 'api/v1/registrations',
    confirmations: 'api/v1/confirmations',
    passwords: 'api/v1/passwords'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
