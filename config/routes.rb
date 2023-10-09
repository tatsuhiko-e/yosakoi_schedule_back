Rails.application.routes.draw do

  namespace :api do
    namespace :mobile do
      mount_devise_token_auth_for 'User', at: "user", controllers: {
        registrations: 'api/mobile/user/registrations'
      }
      namespace :user do
        resources :sessions, only: %i[index]
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
