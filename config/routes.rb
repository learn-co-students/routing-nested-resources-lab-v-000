Rails.application.routes.draw do
  resources :artists, only: [:show, :index, :edit, :new] do
    resources :songs, only: [:show, :index]
  end
  resources :songs, only: [:show, :index, :edit, :new]
end
