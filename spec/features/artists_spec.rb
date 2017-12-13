require 'rails_helper'
describe "artists", type: :feature do

  before do
    Artist.destroy_all
    Song.destroy_all
    @artist = Artist.create!(name: "Daft Punk")
    @song = @artist.songs.create!(title: "The Grid")
  end

  describe "GET /artists" do
    it "links to artists songs path" do
      visit artists_path
      expect(page).to have_link(@artist.name, href: artist_songs_path(@artist))
    end
#Not sure where the @artist instance variable coes from
  end

  describe "GET /artists/id" do
    it "links to artists song path" do
      visit artist_path(@artist)
      expect(page).to have_link(@song.title, href: artist_song_path(@artist, @song))
    end
  end
end
