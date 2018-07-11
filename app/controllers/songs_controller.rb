class SongsController < ApplicationController
  def index
    artist_id = params[:artist_id]
    if artist_id
      set_artist(artist_id).nil? ? (redirect_to artists_path, alert: "Artist not found") : (@songs = @artist.songs)
    else
      @songs = Song.all
    end
  end

  def show
    set_artist(params[:artist_id])
    if set_song.nil?
      redirect_to artist_songs_path(@artist), alert: "Song not found"
    else
      @song
    end
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    @song.save ? (redirect_to @song) : (render :new)
  end

  def edit
    set_song
  end

  def update
    set_song.update(song_params)
    @song.save ? (redirect_to @song) : (render :edit)
  end

  def destroy
    set_song.destroy
    redirect_to songs_path, alert: "Song deleted."
  end

private
  def set_song
    @song = Song.find_by(id: params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end