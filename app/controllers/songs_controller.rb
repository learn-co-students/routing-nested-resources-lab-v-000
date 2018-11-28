class SongsController < ApplicationController
  def index
    if params[:artist_id]
      # binding.pry
      a = Artist.find_by_id(params[:artist_id])
      if a == nil
        redirect_to artists_path, flash:{alert: "Artist not found"}
      else
        @songs = a.songs
      end
    else
      @songs = Song.all
    end
  end

  def show
    if params[:artist_id]
      # binding.pry
      s = Song.find_by_id(params[:id])
      if s == nil
        redirect_to artist_songs_path(Artist.find_by_id(params[:artist_id])), flash: {alert: "Song not found"}
      else
        @song = s
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
