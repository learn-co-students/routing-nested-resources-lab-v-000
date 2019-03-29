Rails.application.routes.draw do
  resources :artists, only: [:index, :show, :new, :create, :edit, :update] do
    resources :songs, only: [:index, :show]
  end

  resources :songs, only: [:index, :show, :new, :create, :edit, :update]

  root 'songs#index'
end
