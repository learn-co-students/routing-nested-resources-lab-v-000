Rails.application.routes.draw do

  resources :songs

  resources :artists do
    #nested resources for songs
    resources :songs, only: [:show, :index]
  end




end
