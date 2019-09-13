require 'pry'
class SongsController < ApplicationController
  def index
    if params[:artist_id]
      @artist = Artist.find_by(id: params[:artist_id])
      if Artist.find_by(id: params[:artist_id])
        @songs = @artist.songs #label songs by artist found
      else #redirect if :artist_id isn't a valid id
        flash[:alert] = "Artist not found"
        redirect_to artists_path
      end
    else
      @songs = Song.all
    end
  end

  def show

    if params[:artist_id]
      @artist = Artist.find_by(id: params[:artist_id])
      if Artist.find_by(id: params[:artist_id])
        @song = @artist.songs.find_by(id: params[:id]) #/artists/1/songs/12345
        if @song == nil
          flash[:alert] = "song not found"
          redirect_to artist_songs_path(params[:artist_id])
        end
      else
      end
    else
      @song = Song.find_by(id: params[:id])
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

