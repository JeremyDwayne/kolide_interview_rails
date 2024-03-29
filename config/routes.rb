Rails.application.routes.draw do
  get '/players' => 'players#index'
  get '/players/:id' => 'players#show', as: :player

  get '/players/new' => 'players#new'
  post '/players' => 'players#create'
  
  get '/players/:id/edit' => 'players#edit'
  patch '/players/:id' => 'players#update'

  root :to => 'players#index'
end
