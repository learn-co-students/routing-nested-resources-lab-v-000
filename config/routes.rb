Rails.application.routes.draw do
  resources :artists, only: [:show] do
    resources :songs, only: [:show, :index]
  end

  resources :artists, only: [:index]
  resources :songs, only: [:index, :show, :edit, :new, :create]
end
