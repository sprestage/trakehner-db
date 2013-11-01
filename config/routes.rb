TrakehnerDb::Application.routes.draw do

  devise_for :users

  devise_scope :user do
    # get "signup", :to => "devise/registrations#new"
    get "signout", :to => "devise/sessions#destroy"
    # get "signin", :to => "devise/sessions#new"
  end

  resources :horses

  # get "home/index"
  root :to => 'home#index'

end
