TrakehnerDb::Application.routes.draw do

  devise_for :users

  devise_scope :user do
    get "sign_up", :to => "devise/sessions#new"
  end

  resources :horses

  # get "home/index"
  root :to => 'home#index'

end
