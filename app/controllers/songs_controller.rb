#require 'rack-flash'

class SongsController < ApplicationController
  #use Rack::Flash

  def index
    if params[:artist_id]
      binding.pry
      if Artist.pluck(:id).index(params[:artist_id].to_i).nil?
        redirect_to artists_path, alert: "Artist not found"
      else
        binding.pry
        @songs = Artist.find(params[:artist_id]).songs
      end
    else
      @songs = Song.all
    end
  end

  def show
    binding.pry
    if Song.find_by(id: params[:id])
      @song = Song.find(params[:id])
    else
      binding.pry
      #flash[:alert] = "Cannot find song"
      @artist = Artist.find(params[:artist_id])
      redirect_to artist_songs_path(@artist), alert: "Song not found"
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
