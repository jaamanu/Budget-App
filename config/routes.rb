# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'groups#index'

  resources :groups, only: %i[new create show] do
    resources :entities, only: %i[new create]
  end
end
