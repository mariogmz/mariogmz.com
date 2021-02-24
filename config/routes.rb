Rails.application.routes.draw do
  namespace :admin do
    root to: "dashboard#index", as: :dashboard
    resource :profile

    resources :pages do
      resources :services, shallow: true, except: [:index]
      resources :projects, shallow: true, except: [:index]
    end
    delete ":id/:image", to: "pages#destroy_image", as: :delete_page_image
  end

  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
