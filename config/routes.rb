Rails.application.routes.draw do
  resources :artists, only: [:show] do
    # nested resource for songs
    resources :songs, only: [:show, :index]
  end
  resources :artists
  resources :songs
  # resources :songs, only: [:index, :show, :new, :create, :edit, :update]

end
