# frozen_string_literal: true

Rails.application.routes.draw do
  resources :awards do
    post "/award_player", to: "awards#award_player", as: :player
  end
  resources :players
  root to: "players#index"
end
