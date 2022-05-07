# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  namespace :owner do
    resources :courses do
      resources :chapters do
        collection do
          resources :sections do
          end
        end
      end
    end
  end

  # frontstate
  resources :courses, only: %i[index show]do
    resources :sections, only: %i[show] do 
    end
  end
end