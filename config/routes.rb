Rails.application.routes.draw do
  # Root route
  root 'home#index' # Sets the root URL of your application to the login action of the HomeController.
  # For registration
  get 'signup', to: 'registration#new'
  post 'signup', to: 'registration#create'
  # For login
  get 'login', to: 'login#new'
  post 'login', to: 'login#create'
  delete 'logout', to: 'login#destroy'
  # For collections
  resources :collections do
    collection do
      patch :bulk_destroy
    end
  end
  # For administrator
  get 'admin', to: 'home#index'
  get 'users', to: 'users#index'
  post 'order_by', to: 'users#order_by'
  resources :users do
    collection do
      patch :bulk_update
    end
  end
end
