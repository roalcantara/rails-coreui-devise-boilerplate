# frozen_string_literal: true

Rails.application.routes.draw do
  resources :components
  resources :traits
  devise_for :users
  root 'home#index'
end
