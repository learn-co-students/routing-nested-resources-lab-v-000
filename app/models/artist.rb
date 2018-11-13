class Artist < ActiveRecord::Base
  has_many :songs

  def self.valid_artist?(params)
    Artist.find(params[:artist_id]) ? true : nil
  end
end
