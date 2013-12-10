TrakehnerDb::Application.routes.draw do

  scope "(:locale)", locale: /en|de/ do

    get '/contact' => 'static#contact'
    get '/about' => 'static#about'

    resources :breeders

    resources :horses do
      member do
        get 'progeny'
      end
    end

    devise_for :users

    devise_scope :user do
      get "signout", :to => "devise/sessions#destroy"
    end

    # get "home/index"
    root :to => 'home#index'

  end

end
