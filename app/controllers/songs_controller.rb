class SongsController < ApplicationController
  #allow the #index and #show actions to handle a valid song for the artist.

  def index
    if params[:artist_id]
      @songs = Artist.find(params[:artist_id]).songs
    else
      flash[:notice] = "Artists not found."
      redirect_to artists_path      
    end
  end
 #In the #index action, if the artist can't be found, 
 #redirect to the index of artists, and set a flash[:alert] of "Artist not found."
  
  def show
    if params[:song_id]
      @song = Song.find(params[:id])
    else
      flash[:notice] = "Song not found."
      redirect_to artist_songs_path(@artist)
    end
  end
  #In the songs#show action, if the song can't be found for a given artist, 
  #redirect to the index of the artist's songs and set a flash[:alert] of "Song not found."
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

