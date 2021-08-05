Rails.application.routes.draw do
  scope 'api', defaults: { format: :json } do
    scope 'v1' do
      resources :topics
    end
  end
  get 'registrations/sign_up_params'
  mount_devise_token_auth_for 'User', at: 'api/v1'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
