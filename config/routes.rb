Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: [:show, :index]
  end

  resources :songs, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  root 'songs#index'
end
