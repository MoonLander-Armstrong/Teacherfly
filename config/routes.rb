# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  namespace :owner, only: [] do
    resources :chapters, except: [:show] do
      resources :sections, except: [] do
      end
    end
  end

  resources :chapters, only: [] do
    resources :sections, only: [:index, :show] do
    end
  end
end
