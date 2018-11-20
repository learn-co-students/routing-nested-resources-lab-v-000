class SongsController < ApplicationController
  def index
    if params[:artist_id] #doing whole statement returns error, this returns nil
      if Artist.find_by_id(params[:artist_id]) #doing find instead of find_by_id returns error, this returns nil
        @songs = Artist.find(params[:artist_id]).songs
      else
        flash[:alert] = "Artist not found."
        @artists = Artist.all
        redirect_to artists_path
      end
    else
      flash[:alert] = "Artist not found."
      @songs = Song.all
      #difference between not finding artist and not having id period-if no id just rerender songs index
    end
  end

  def show
    if params[:id]
      if Song.find_by_id(params[:id])
        @song = Song.find_by_id(params[:id])
      else
        @artist = Artist.find_by_id(params[:artist_id])
        flash[:alert] = "Song not found."
        redirect_to artist_songs_path(@artist)
      end
    else
      @artist = Artist.find_by_id(params[:artist_id])
      flash[:alert] = "Song not found."
      redirect_to artist_songs_path(@artist)
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
