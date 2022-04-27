Rails.application.routes.draw do
  root to: "courses#index"
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :courses

  resources :site do 
    member do 
      :courses
    end
  end
end
