class Song < ActiveRecord::Base
  belongs_to :artist
  
  def artist_name=(name)
    song = Song.new(title: title)
    self.artist_name
    song.save
  end
  # it "can set the artist via name" do
  #   song = Song.new(title: "Mad World")
  #   song.artist_name = "Tears for Fears"
  #   song.save
  #   expect(song.artist_name).to eq "Tears for Fears"
  #   expect(song.artist.name).to eq "Tears for Fears"
  
  def artist_name
    self.try(:artist).try(:name)
  end
#it "gets the artist name" do
#expect(@grid.artist_name).to eq("Daft Punk")
end
