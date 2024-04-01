# frozen_string_literal: true

Rails.application.routes.draw do
  resources :players
  root to: "players#index"
end
