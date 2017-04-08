class SongsController < ApplicationController

  def index
    if params[:artist_id]
      artist = Artist.find_by(id: params[:artist_id])
      if !artist.nil?
        @songs = artist.songs
      else
        artist_not_found
      end
    else
      @songs = Song.all
    end
  end

  def show
    if params[:artist_id]
      artist = Artist.find_by(id: params[:artist_id])
      if !artist.nil?
        song_array = artist.songs.select {|s| s.id == params[:id].to_i }
        if song_array.size > 0
          @song = song_array.first
        else
          song_not_found
        end
      else
        artist_not_found
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

    def artist_not_found
      flash[:alert] = "Artist not found."
      redirect_to artists_path
    end

    def song_not_found
      flash[:alert] = "Song not found."
      redirect_to artist_songs_path
    end

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end
