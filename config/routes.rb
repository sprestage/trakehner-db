TrakehnerDb::Application.routes.draw do

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

    resources :breeders

    devise_for :users

    devise_scope :user do
      get "signout", :to => "devise/sessions#destroy"
    end

    resources :horses do
      member do
        get 'progeny'
      end
    end

    # get "home/index"
    root :to => 'home#index'

    get ':action' => 'static#:action'

  end

end
