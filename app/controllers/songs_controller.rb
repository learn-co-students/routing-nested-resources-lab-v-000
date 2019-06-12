class SongsController < ApplicationController
  def index
    # verify truthiness of artist_id
    if params[:artist_id]
      # saving this query as a variable will reduce database server load. Memoize.
      @artist = Artist.find_by(id: params[:artist_id])
      if !@artist.nil?
        @songs = @artist.songs
      else
        # compacted executable for path && flash
        redirect_to artists_path, alert: "Artist not found"
      end
    else
      @songs = Song.all
    end
  end

  def show
    if params[:artist_id]
      # same reasoning as above but with two variables
      @artist = Artist.find_by(id: params[:artist_id])
      @song = @artist.songs.find_by(id: params[:id])
      if !@song.nil?
        @song = Song.find(params[:id])
      else
        redirect_to artist_songs_path(@artist), alert: "Song not found"
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
