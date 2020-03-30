# frozen_string_literal: true

Rails.application.routes.draw do
  resources :friendships
  resources :members
  resources :find_experts, only: [:index]
  get '/find_experts/find_experts', to: 'find_experts#find_experts'
end
