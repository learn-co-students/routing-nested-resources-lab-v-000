class SongsController < ApplicationController
  def index
    if params[:artist_id]
      if artist_exists?
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
    if params[:artist_id]
      if song_exists?
        @song = Artist.find(params[:artist_id]).songs.find(params[:id])
      else
        flash[:alert] = "Song not found"
        redirect_to artist_songs_path
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

  def artist_exists?
    Artist.exists?(id: params[:artist_id])
  end

  def song_exists?
    Song.exists?(id: params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end