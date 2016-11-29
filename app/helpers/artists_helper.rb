module ArtistsHelper
  def display_artist(song)
<<<<<<< HEAD
    song.artist.nil? || song.artist.name == "" ? link_to("Add Artist", edit_song_path(song)) : link_to(song.artist_name, artist_path(song.artist))
=======
    song.artist.nil? ? link_to("Add Artist", edit_song_path(song)) : link_to(song.artist_name, artist_path(song.artist))
>>>>>>> 60f92d6495cfaaf6c144bf137258bd9b693bbaaf
  end
end
