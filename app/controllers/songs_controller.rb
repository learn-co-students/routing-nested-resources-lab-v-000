class SongsController < ApplicationController

  def index
    @artist = Artist.find_by(id: params[:artist_id])
    if params[:artist_id].nil?
      @songs = Song.all
    elsif @artist
      @songs = @artist.songs
    else
      flash[:alert] = "Artist not found"
      redirect_to artists_path
    end
  end

  def show
    if params[:artist_id]
      @artist = Artist.find_by(id: params[:artist_id])
      @song = @artist.try(:songs).find_by(id: params[:id])
    end
    if @song && !@artist
      @song = Song.find_by(id: params[:id])
    elsif @song && @artist
      @artist = Artist.find_by(id: params[:artist_id])
      @song = @artist.try(:songs).find_by(id: params[:id])
    elsif !@song && @artist
      flash[:alert] = "Song not found"
      redirect_to artist_songs_path(@artist)
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

    if params[:artist_id]
      @song = Song.find(params[:id])
      redirect_to edit_song_path(@song)
    else
      @song = Song.find(params[:id])
    end
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
