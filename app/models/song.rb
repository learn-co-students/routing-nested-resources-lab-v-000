class Song < ActiveRecord::Base
  belongs_to :artist

  def self.filtered_songs(artist_id)
    where('artist_id = (?)', artist_id)
  end

  def artist_name
    try(:artist).try(:name)
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end
end
