class SongsController < ApplicationController
  def index
    if artist_id
      @artist = Artist.find_by(id: artist_id)
      if @artist.present?
        @songs = @artist.songs
      else
        redirect_to artists_path
        flash[:alert] = "Artist not found."
      end
    else
      @songs = Song.all
    end
  end

  def show
    if artist_id
      @artist = Artist.find_by(id: artist_id)
      @song = @artist.songs.find_by(id: song_id)

      if @song.nil?
        redirect_to artist_songs_path(@artist)
        flash[:alert] = "Song not found."
      end
      else
        @song = Song.find(song_id)
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

  def artist_id
    params[:artist_id]
  end

  def song_id
    params[:id]
  end


end
