Rails.application.routes.draw do
  resources :artists, only [:show] do
    resources :song, only [:show, :index]
  end
  resources :songs
  root 'songs#index'
end
