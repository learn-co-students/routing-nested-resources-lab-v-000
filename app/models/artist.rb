class Artist < ActiveRecord::Base
  has_many :songs

  def valid_artist?(artist_id)
    self.pluck(:id).include?(artist_id)
  end

end
