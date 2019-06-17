class Artist < ActiveRecord::Base
  has_many :songs

  def unique_songs
    self.songs.select(:title).distinct
  end

end
