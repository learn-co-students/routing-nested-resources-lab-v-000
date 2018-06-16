Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: [:show, :index]
  end
  resources :artists
  resources :songs
end
