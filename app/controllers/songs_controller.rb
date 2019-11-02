class SongsController < ApplicationController
  def index
    if artist?
      if Artist.exists?(params[:artist_id])
        @songs = Artist.find(params[:artist_id]).songs
      else
        flash[:alert] = "Artist not found"
        redirect_to artists_path
      end
    else
      @songs = Song.all
    end
  end

  def show
    if artist?
      if Artist.exists?(params[:artist_id])
        artist = Artist.find(params[:artist_id])
        if artist.songs.exists?(params[:id])
          @song = artist.songs.find(params[:id])
        else
          # CAN SET FLASH ALERT LIKE THIS
          flash[:alert] = "Song not found"
          redirect_to artist_songs_path(artist)
        end
      end
    else
      @song = Song.find(params[:id])
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
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end

  def artist?
    !!params[:artist_id]
  end
end
