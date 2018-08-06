class SongsController < ApplicationController
  def index
    if params[:artist_id]
      @songs = Song.songs_by_artist(params[:artist_id])
      if @songs.count == 0
        redirect_to artists_path, alert: "Artist not found"
      end
    else
      @songs = Song.all
    end
  end

  def show
    if params[:artist_id]
      @song = Song.find_by(:id => params[:id],:artist_id => params[:artist_id])
      if !@song
        redirect_to artist_songs_path(params[:artist_id]), alert: "Song not found"
      end
    else
      @song = Song.find(params[:id])
      if !@song
        redirect_to songs_path
      end
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
end