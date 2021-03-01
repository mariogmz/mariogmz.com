Rails.application.routes.draw do
  namespace :admin do
    root to: "dashboard#index", as: :dashboard
    resource :profile

    resources :pages do
      resources :services, shallow: true, except: [:index] do
        delete "image", action: :purge_image
      end
      resources :projects, shallow: true, except: [:index]
      delete "image/:name", action: :purge_image, as: :delete_image
    end

    scope "/experience" do
      root to: "experience#index", as: :experience
      resources :jobs, shallow: true, except: %i[new index]
      resources :categories, shallow: true, except: %i[new index]
      resources :skills, shallow: true, except: %i[new index]
      resources :soft_skills, shallow: true, except: %i[new index]
    end
  end

  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"
end
