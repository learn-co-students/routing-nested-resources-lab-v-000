class Artist < ActiveRecord::Base
  has_many :songs

  def has_song?(song_id)
    self.songs.exists?(song_id)
  end
end
