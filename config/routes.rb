Rails.application.routes.draw do

  resources :artists, only: [:show] do 
  	resources :songs, only: [:index, :show]
  end

  resources :songs, only: [:index, :show, :new, :create, :edit, :update]
  resources :artists, only: [:index, :new, :create, :edit, :update]

  

end
