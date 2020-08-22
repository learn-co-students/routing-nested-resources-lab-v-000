Rails.application.routes.draw do
 
  resources :artists, only: [:show, :index] do
    resources :songs, only: [:index, :show] 
  end
  
  resources :songs, only: [:index, :show, :new, :create, :edit, :update]
end


  #how can it only be :show when the folder has all of the view files new, edit, show, index?

# resources :artists, only: [:show, :index, :new, :edit] do
#   resources :songs, only: [:index, :show] 
# end

# resources :songs, only: [:index, :show, :new, :create, :edit, :update]