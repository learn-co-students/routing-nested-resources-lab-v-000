Rails.application.routes.draw do
  resources :artists, only: [:show, :index, :new, :edit] do 
    resources :songs, only: [:show, :index]
  end
  resources :songs
end
