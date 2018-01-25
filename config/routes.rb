Rails.application.routes.draw do
#create a nested resource route to show all songs for an artist

  resources :artists do 
    resources :songs, only: [:show, :index]
  end 

  resources :songs 
end
