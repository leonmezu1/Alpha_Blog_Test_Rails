# frozen_string_literal: true

Rails.application.routes.draw do
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  # get '', to: ''
  get 'about', to: 'pages#about'
	# get '', to: ''
	
	resources :articles
end
