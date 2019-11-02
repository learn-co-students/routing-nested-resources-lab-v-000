Rails.application.routes.draw do
  # resources :artists
  resources :songs

  resources :artists, only: [:index, :show] do
    # nested resource for posts
    resources :songs, only: [:show, :index]
  end
 
  
 
  root 'songs#index'
end
