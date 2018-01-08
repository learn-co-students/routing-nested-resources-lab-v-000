Rails.application.routes.draw do

  resources :artists do#, only: [:show, :index] do
    resources :songs, only: [:index, :show]
  end

  resources :songs

  #root 'songs#index' #did not need this to pass tests
  # resources :artists
  # resources :songs
end
