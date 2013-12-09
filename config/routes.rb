TrakehnerDb::Application.routes.draw do

  scope "(:locale)", locale: /en|de/, defaults: { locale: 'en' } do

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
  get '*path', to: redirect("/#{I18n.default_locale}/%{path}"), constraints: lambda { |req| !req.path.starts_with? "/#{I18n.default_locale}/" }
  get '', to: redirect("/#{I18n.default_locale}")

end
