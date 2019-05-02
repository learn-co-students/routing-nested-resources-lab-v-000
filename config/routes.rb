Rails.application.routes.draw do
  resources :artists
  resources :songs

  resources :authors, only: [:show] do
  # nested resource for posts
  resources :songs, only: [:show, :index]
end

end
