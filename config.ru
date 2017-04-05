# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
run Rails.application

get 'artists/:id/songs', to: 'artists#songs_index'
get 'artists/:id/songs/:post_id', to: 'artists#post'
