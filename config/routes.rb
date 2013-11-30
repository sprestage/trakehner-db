TrakehnerDb::Application.routes.draw do

  devise_for :users

  devise_scope :user do
    get "signout", :to => "devise/sessions#destroy"
  end

  resources :horses

  # get "home/index"
  root :to => 'home#index'

  get ':action' => 'static#:action'

end
