class SongsController < ApplicationController

  def index

    if params[:artist_id]
      @artist = Artist.find_by(id: params[:artist_id])
      if @artist.nil?
        redirect_to artists_path
      else
        @songs = @artist.songs
      end
    else
      @songs = Song.all
    end

  end

  def show
    @artist_songs = Artist.find(params[:artist_id]).songs
    #binding.pry
    #@song = @artist_songs.find(params[:id].to_i)
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

  def is_int?(var)
    var.is_a? Integer
  end

end
