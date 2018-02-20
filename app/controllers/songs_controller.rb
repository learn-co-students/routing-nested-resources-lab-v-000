class SongsController < ApplicationController
  def show
    #binding.pry
    if Song.exists?(params[:id])
      @song = Song.find(params[:id])
    else
      flash[:alert] = "Song not found"
      redirect_to artist_songs_path(Artist.find(params[:artist_id]))
    end
  end

  def index
    #binding.pry
    if params[:artist_id]
      if params[:artist_id].to_i != 0 && Artist.exists?(params[:artist_id])
        @artist = Artist.find(params[:artist_id])
        @songs = @artist.songs
      else
        flash[:alert] = "Artist not found"
        redirect_to artists_path
      end
    else
    @songs = Song.all
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
