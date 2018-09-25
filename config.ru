# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
run Rails.application

Rails.application.routes.draw do

  resources :artists, only: [:show ] do
    resources :songs, only: [:show, :index]
end

resources :songs, only: [:index, :show, :new, :create, :edit, :update]

root 'songs#index'
  end
