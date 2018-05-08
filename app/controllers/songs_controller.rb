class SongsController < ApplicationController
  def index
    #binding.pry
    if params[:artist_id]
      @songs = Artist.find(params[:artist_id]).songs
    else
      @songs = Song.all
    end
    rescue ActiveRecord::RecordNotFound
      flash[:notice] = 'Artist not found'
      redirect_to artists_path
  end

  def show
    #binding.pry
    if params[:artist_id]
      @song = Artist.find(params[:artist_id]).songs.find(params[:id])
    else
      @song = Song.find(params[:id])
    end
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "Song not found"
      redirect_to artist_songs_path(params[:artist_id])
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
