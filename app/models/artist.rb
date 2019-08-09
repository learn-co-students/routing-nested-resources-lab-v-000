class Artist < ActiveRecord::Base
  has_many :songs
  
  def owns_song?(song)
      self.songs.include?(song)
  end
  
end
