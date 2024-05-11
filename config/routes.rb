Rails.application.routes.draw do
  # Root route
  root 'home#index' # Sets the root URL of your application to the login action of the HomeController.

  get 'signup', to: 'registration#new'
  post 'signup', to: 'registration#create'

  get 'login', to: 'login#new'
  post 'login', to: 'login#create'
  delete 'logout', to: 'login#destroy'
  
  # For administrator
  get 'admin_home', to: 'home#admin_index'
  get 'users', to: 'users#index'
  post 'order_by', to: 'users#order_by'
  resources :users do
    collection do
      patch :bulk_update
    end
  end
end
