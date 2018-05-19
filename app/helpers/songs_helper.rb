module SongsHelper
  def display_song(song)
    if song.artist.nil? || !params[:artist_id]
      link_to song.title, song_path(song) 
    else
      link_to song.title, artist_song_path(song.artist, song)
    end
  end
end
