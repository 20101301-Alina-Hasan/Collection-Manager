Rails.application.routes.draw do
  # Root route
  root 'home#index' # Sets the root URL of your application to the login action of the HomeController.

  get 'signup', to: 'registration#new'
  post 'signup', to: 'registration#create'

  get 'login', to: 'login#new'
  post 'login', to: 'login#create'
  delete 'logout', to: 'login#destroy'

  get 'users', to: 'users#index'

  resources :users do
    collection do
      patch :bulk_update
    end
  end
  
end
