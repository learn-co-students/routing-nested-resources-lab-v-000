class Song < ActiveRecord::Base
  belongs_to :artist

  def artist_name
    self.try(:artist).try(:name)
  end

  def artist_name=(name) # Suggested edit below. Open a PR for this; it prevents an artist with a name of "" from being saved.
    artist = Artist.find_or_create_by(name: name) unless name.blank?
    self.artist = artist
  end
end
