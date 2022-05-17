# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # back stage
  namespace :owner do
    resources :lecturers
    resources :courses do
      member do
        get :information
        get :curriculum
        get :comments
      end
      resources :chapters do
        resources :sections, only: [:new, :create]

        collection do
          resources :sections, except: [:new, :create] do 
            resources :comments, shallow: true, only: [:create, :destroy]
          end
        end
      end
    end
    resources :users, only: [:index, :update] do
      member do
        get :information
      end
    end
  end

  # front stage
  resources :courses, only: %i[index show]do
    resources :sections, only: %i[show] do
      resources :comments, shallow: true, only: [:create, :destroy]
    end
  end

  # API
  namespace :api do
    namespace :v1 do
      resources :comments, only: [] do
        member do 
          post :reply
        end
      end
    end
  end

end
