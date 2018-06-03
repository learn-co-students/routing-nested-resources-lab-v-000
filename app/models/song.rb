class Song < ActiveRecord::Base
  belongs_to :artist

  def artist_name
    self.try(:artist).try(:name)
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end
end

# rspec spec/models/song_spec.rb
# rspec spec/controllers/songs_controller_spec.rb
# rspec spec/features/songs_spec.rb   <<-- WIP
# rspec spec/views/songs/index.html.erb_spec.rb
# rspec spec/views/songs/show.html.erb_spec.rb

# rspec spec/controllers/artists_controller_spec.rb
# rspec spec/features/artists_spec.rb    <<-- WIP
# rspec spec/helpers/artists_helper_spec.rb
# rspec spec/routing/artists_routing_spec.rb
