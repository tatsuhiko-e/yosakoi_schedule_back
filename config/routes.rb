Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'Admin', at: "admin", controllers: {
        registrations: 'api/mobile/user/registrations'
      }
      namespace :admin do
        resources :sessions, only: %i[index]
      end
    end
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
