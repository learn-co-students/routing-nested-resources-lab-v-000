require 'pry'
class SongsController < ApplicationController

  def index
    if params[:artist_id]
      if Artist.pluck(:id).include?(params[:artist_id].to_i)
        @songs = Artist.find(params[:artist_id]).songs
      else
        flash[:alert] = "Artist not found."
        redirect_to "/artists"
      end
    else
      @songs = Song.all
    end
  end

  def show
    #binding.pry
    if params[:artist_id]
      if Song.pluck(:id).include?(params[:id].to_i)
        @song = Song.find(params[:id])
      else
        flash[:alert] = "Song not found."
        redirect_to "/artists/#{params[:artist_id]}/songs" and return
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
end
