class SongsController < ApplicationController
  def index
    if params[:artist_id] && find_artist
      @songs = find_artist.songs
    elsif params[:artist_id]
      flash[:alert] = "Artist not found"
      redirect_to artists_path
    else
      @songs = Song.all
    end
  end

  def show
    if params[:artist_id] && find_artist && find_song
      @artist = find_artist
      @song = find_song
    elsif params[:artist_id] && find_artist
      @artist = find_artist
      flash[:alert] = "Song not found"
      redirect_to artist_songs_path(@artist.id)
    elsif find_song
      @song = find_song
    else
      flash[:alert] = "Song not found"
      redirect_to artists_path
    end
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = find_song
  end

  def update
    @song = find_song

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = find_song
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end

  def find_song
    Song.find_by(id: params[:id])
  end

  def find_artist
    Artist.find_by(id: params[:artist_id])
  end
end

