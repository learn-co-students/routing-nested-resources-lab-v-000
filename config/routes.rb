Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: [:index, :show] 
  
#Only include resources that are nested under the head resource above!

  end
  resources :songs
end
