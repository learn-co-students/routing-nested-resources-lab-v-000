class SongsController < ApplicationController

  def index
    if params[:artist_id]
      if Artist.find_by(id: params[:artist_id]) == nil

        redirect_to artists_path
      else
        @songs = Artist.find(params[:artist_id].songs)
      end
    else
      @songs = Song.all
    end
  end

  def show

    artist = Artist.find(params[:artist_id]
    # if song can't be found for specific artist
    if artist.songs
    # redirect to (artist_songs_path(artist_id))
    # else
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
