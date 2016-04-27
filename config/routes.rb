Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: [:index, :show]
  end

 # get '/artists/songs', to: 'songs#index'

  resources :songs, only: [:new, :create, :edit, :update]
end
