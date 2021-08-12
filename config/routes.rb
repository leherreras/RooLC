Rails.application.routes.draw do
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
end
