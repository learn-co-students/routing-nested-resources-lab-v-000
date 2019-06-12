Rails.application.routes.draw do
  resources :artists, only: [:show] do
    # nested resource for songs through artist#show as:
    # resources :artists do is scope creep
    resources :songs, only: [:show, :index]
  end

  resources :artists
  resources :songs

end
