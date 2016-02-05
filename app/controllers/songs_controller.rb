class SongsController < ApplicationController
  def index

    if params[:artist_id]
      artist=get_artist
      require 'pry'
      binding.pry
      if artist
        @songs=artist.songs 
      else
        redirect_to artists_path, alert: "Artist not found"
      end 
    else
      @songs = Song.all
    end

  end

  def show
    @song=get_song
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

  def get_artist
    Artist.exists?(params[:artist_id]) ? Artist.find(params[:artist_id]) : false
  end

  def get_song

    if params[:artist_id]

      artist=get_artist

      if artist 
        if artist.songs.exists?(params[:id]) 
          return artist.songs.find(params[:id])
        else
          redirect_to artist_songs_path, alert: "Song not found"
        end
      else 
        redirect_to artists_path, alert: "Artist not found"
      end

    else
      if Song.exists?(params[:id]) 
        return Song.find(params[:id])
      else
        redirect_to songs_path, alert: "Song not found"
      end
    end

  end


end

