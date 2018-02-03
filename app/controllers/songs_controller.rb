class SongsController < ApplicationController
  def index
    if params[:artist_id]
      if Artist.where(id: params[:artist_id]).empty?
        redirect_to artists_path, alert: "Artist not found"
      else
        @songs = Artist.find(params[:artist_id]).songs
      end
    else
      @songs = Song.all
    end
  end

  def show
    if Song.where(id: params[:id]).empty?
      redirect_to artist_songs_path, alert: "Song not found"
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
    redirect_to songs_path, notice: "Song deleted."
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end
