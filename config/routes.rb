Rails.application.routes.draw do
  resources :artists do
    # nested resources for songs
    resources :songs, only: [:show, :index]
  end
  resources :songs
end
