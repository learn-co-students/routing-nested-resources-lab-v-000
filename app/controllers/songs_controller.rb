class SongsController < ApplicationController
  def index
    @artist = Artist.find_by(id: params[:artist_id])
    if !@artist
      redirect_to artists_path, alert: "Artist not found"
    else
      redirect_to songs_path
    end


    #lets search for the songs artist
    #if artist not found
    #redirect to an artist not found
    # if there is an artist
    # assign @song to the artist songs
    #so we can render the songs on the pages
  end

  def show
    @song = Song.find(params[:id])
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
