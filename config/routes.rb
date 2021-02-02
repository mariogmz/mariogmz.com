Rails.application.routes.draw do
  namespace :admin do
    root to: "dashboard#index", as: :dashboard
    resource :profile
    resources :pages
  end

  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
