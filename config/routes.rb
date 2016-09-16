Rails.application.routes.draw do
  resources :songs
  resources :artists, only: [:show, :index] do
    # nested resource for artists
    resources :songs, only: [:show, :index]
  end

end
