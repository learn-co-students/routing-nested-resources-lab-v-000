class Song < ActiveRecord::Base
  belongs_to :artist

  def artist_name
    # artist.name if artist is the same thing as #try(object)!
    self.try(:artist).try(:name)
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end
end
