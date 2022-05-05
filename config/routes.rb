# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  namespace :owner do
    resources :courses do 
    end
  end


  #前台
  resources :courses, only: %i[index show]do
    resources :sections, only: %i[index show] do 
    end
  end
  
end