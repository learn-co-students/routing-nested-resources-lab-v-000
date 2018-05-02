class Song < ActiveRecord::Base
  belongs_to :artist

  def artist_name
    self.try(:artist).try(:name)
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end
  
  def self.artist_songs(artist)
    self.all.map{|song|song.artist_id == artist}
  end
end
