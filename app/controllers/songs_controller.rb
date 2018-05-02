require 'rack-flash'

class SongsController < ApplicationController

  use Rack::Flash

  def index
    if params[:artist_id] && Artist.exists?(id: params[:artist_id])
      @songs = Artist.find(params[:artist_id]).songs
    elsif params[:artist_id]
      @artists = Artist.all
      flash[:alert] = "Artist not found"
      redirect_to artists_path
    else
      @songs = Song.all
    end
  end

  def show
    if params[:artist_id] && Artist.exists?(id: params[:artist_id]) && Song.exists?(id: params[:id])
      @song = Song.find(params[:id])
      @artist = Artist.find(params[:artist_id])
    elsif params[:artist_id] && Artist.exists?(id: params[:artist_id])
      flash[:alert] = "Song not found"
      @artist = Artist.find(params[:artist_id])
      redirect_to artist_songs_path(@artist)
    elsif Song.exists?(id: params[:id])
      @song = Song.find(params[:id])
    else
      flash[:alert] = "Song not found"
      redirect_to songs_path
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
