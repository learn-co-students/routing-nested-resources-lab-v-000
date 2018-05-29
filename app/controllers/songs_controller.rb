class SongsController < ApplicationController

  def index
    if params[:artist_id]
      @artist = Artist.find_by(id: params[:artist_id])
      #@artist = Artist.find_by_id(params[:artist_id]) works too
      #@artist = Artist.find(params[:artist_id]) does not work because it assumes there is definitely an object with that ID so it will raise an exception if it is not found whereas find_by will return nil if it is not found
      if @artist.present?
        @songs = @artist.songs
      else
        redirect_to artists_path, alert: "Artist not found."
      end
    else
      @songs = Song.all
    end
  end

  def show
    if params[:artist_id]
      @artist = Artist.find_by(id: params[:artist_id])
      @song = @artist.songs.find_by(id: params[:id])
      if @song.present?
        @songs = @artist.songs
      else
        redirect_to artist_songs_path, alert: "Song not found."
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

