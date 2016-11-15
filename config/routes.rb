Rails.application.routes.draw do
  resources :artists, only: [:show] do
    resources :songs, only: [:index, :show]
  end
  
  resources :artists, only: [:index]
  
  resources :songs
end
