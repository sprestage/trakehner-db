TrakehnerDb::Application.routes.draw do

  scope "(:locale)", locale: /en|de/ do

    get '/contact' => 'static#contact'
    get '/about' => 'static#about'

    resources :breeders

    resources :horses do
      resources :photos, only: [:edit, :create, :new, :update, :destroy]
      member do
        get 'progeny'
      end
    end

    devise_for :users, :skip => [:registrations]
    as :user do
      get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
      put 'users' => 'devise/registrations#update', :as => 'user_registration'
    end

    devise_scope :user do
      get "signout", :to => "devise/sessions#destroy"
    end

    # get "home/index"
    root :to => 'home#index'
    get '/:locale' => 'home#index'

  end

end
