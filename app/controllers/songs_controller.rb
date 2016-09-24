class SongsController < ApplicationController
  before_action :find_song, only: [:show, :edit, :update, :destroy]
  def index

    if !params[:artist_id].nil?
      if Artist.find_by(id: params[:artist_id]).nil?
        flash[:alert] = "Artist not found."
        redirect_to artists_path
      else
        @songs = Artist.find_by(id: params[:artist_id]).songs
      end
    else
      @songs = Song.all
    end
  end

  def show
    if params[:artist_id]
      if !@song
        @artist = Artist.find_by(id: params[:artist_id])
        flash[:alert] = "Song not found"
        redirect_to artist_songs_path(@artist)
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
    
  end

  def update

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def find_song
    @song = Song.find_by(id: params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end
