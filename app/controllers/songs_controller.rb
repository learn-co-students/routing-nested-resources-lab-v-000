class SongsController < ApplicationController
  before_action :find_song, only: [:edit, :update, :destroy]

  def index
   if !params[:artist_id]
     @songs = Song.all
   else
     @artist = Artist.find_by(id: params[:artist_id])
     if @artist.nil?
       flash[:alert] = "Artist not found."
       redirect_to artists_path
     else
       @songs = @artist.songs
     end
   end
  end

  def show
    if !params[:artist_id]
      find_song
    else params[:artist_id]
      @artist = Artist.find_by(id: params[:artist_id])
      @song = @artist.songs.find_by(id: params[:id])
      if @song.nil?
        flash[:alert] = "Song not found"
        redirect_to artist_songs_path(@artist)
      end
    end
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
    save_or_redirect(:new)
  end

  def edit
  end

  def update
    @song.update(song_params)
    save_or_redirect(:edit)
  end

  def destroy
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end

  def find_song
    @song = Song.find(params[:id])
  end

  def save_or_redirect(view)
    @song.valid? ? (redirect_to @song) : (render view)
  end

end
