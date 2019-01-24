Rails.application.routes.draw do
  
  resources :artists, only: [:show, :index] do 
    resources :songs, only: [:show, :index]  # nested resource 
  end 
  
  resources :songs, only: [:index, :show, :new, :create, :edit, :update]

   
  root 'songs#index'
end

