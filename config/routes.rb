Rails.application.routes.draw do

  resources :artists, only: [:show, :index] do
    resources :songs, only: [:index, :show]
  end

  resources :songs, only: [:index, :show, :create, :new, :edit, :update]

  root 'songs#index'
end
