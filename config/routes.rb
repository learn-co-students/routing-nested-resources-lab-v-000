Rails.application.routes.draw do

  resources :artists do
    # nested resource for songs
    resources :songs, only: [:show, :index]
  end

  resources :songs, only: [:index, :show, :new, :create, :edit, :update]

  root 'songs#index'
  #get 'artists/:id/songs', to: 'artists#songs_index', only: [:index, :show]
  #get 'artists/:id/songs/:song_id', to: 'artists#song', only: [:index, :show]
end
