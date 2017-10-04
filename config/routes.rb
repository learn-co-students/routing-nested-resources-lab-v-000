Rails.application.routes.draw do
  resources :artists, only: [:show] do
    # nested resource for posts
    resources :songs, only: [:show, :index]
  end

  resources :artists
  resources :songs

end
