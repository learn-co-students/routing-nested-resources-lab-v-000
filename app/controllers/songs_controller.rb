class SongsController < ApplicationController
  def index
    # If params[:artist_id] exists...
    if params[:artist_id]
      # If the artist exists...
      if @artist = Artist.find_by(id: params[:artist_id])
        # @songs gets the artists songs
        @songs = @artist.songs
      else
        # Else Redirect to artists path, alert the user
        redirect_to artists_path, alert: "Artist not found."
      end
    else
      @songs = Song.all
    end
  end

  def show
    # If params[:artist_id] exists...
    if params[:artist_id]
      # Find the artist
      @artist = Artist.find_by(id: params[:artist_id])
      # Find the song
      @song = @artist.songs.find_by(id: params[:id])
      # If the song doesn't exist...
      if @song.nil?
        # Redirect to the artist's songs page, alert the user
        redirect_to artist_songs_path(@artist), alert: "Song not found."
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

