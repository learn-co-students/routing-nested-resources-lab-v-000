Rails.application.routes.draw do
  resources :artists, only: [:edit, :index, :new, :show] do
  	resources :songs, only: [:index, :show]
  end	
  resources :songs
end
