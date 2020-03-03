# frozen_string_literal: true

Rails.application.routes.draw do
  resources :articles
  resources :users, except: %i[new]
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
end
