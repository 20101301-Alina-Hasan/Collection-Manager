Rails.application.routes.draw do
  # Root route
  root 'home#index' # Sets the root URL of your application to the login action of the HomeController.

  get 'signup', to: 'registration#new'
  post 'signup', to: 'registration#create'

  get 'login', to: 'login#new'
  
end
