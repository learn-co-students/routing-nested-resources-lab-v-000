Rails.application.routes.draw do
  # resources :artists
  # resources :songs

  # get 'artists/:id/songs', to: 'artists#songs_index'
  resources :artists, only: [:show, :index] do
    resources :songs, only: [:show, :index]
  end

  # get 'artists/:id/songs/:song_id' to: 'artists#post'
  resources :songs, only: [:index, :show, :new, :create, :edit, :update]

  root 'songs#index'

end
