class SongsController < ApplicationController

  def index
    if params[:artist_id]
      artist_check
      @songs = Song.where(artist_id: params[:artist_id])
    else
      @songs = Song.all
    end
  end

  def show
    if params[:artist_id]
      @song = Song.where(id: params[:id], artist_id: params[:artist_id]).first
      song_check
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

  def artist_check
    if Artist.find_by(id: params[:artist_id]).nil?
      flash[:alert] = 'Artist not found'
      redirect_to artists_path
    end
  end

  def song_check
    if @song.nil?
      flash[:alert] = "Song not found"
      @artist = Artist.find(params[:artist_id])
      redirect_to artist_songs_path(@artist)
    end
  end

end

