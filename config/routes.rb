TrakehnerDb::Application.routes.draw do

  devise_for :users

  devise_scope :user do
    get "signup", :to => "devise/sessions#new"
    get "signout", :to => "devise/sessions#destroy"
  end

  resources :horses

  # get "home/index"
  root :to => 'home#index'

end
