Rails.application.routes.draw do
<<<<<<< HEAD
  resources :songs
  resources :artists
  resources :artists, only: [:index] do
    resources :songs, only: [:show, :index]
  end
=======
  resources :artists, only: [:show, :index] do
    resources :songs, only: [:show, :index]
  end
  resources :songs, only: [:index, :show, :new, :create, :edit, :update]
>>>>>>> f6938e310d05f74fb5ac7849ef5bd7984229d7fa
end
