class SongsController < ApplicationController
  def index
    @songs = Artist.find(params[:artist_id]).songs
  end


  def show
    @artist = Artist.find_by(id: params[:artist_id]) 
    @song = Song.find_by(id: params[:id]) 
  end

  def new
    @song = Song.new
    @artist = Artist.find_by(id: params[:artist_id]);
  end

  def create
    @artist = Artist.find_by(id: params[:artist_id]); 
    @song = @artist.songs.build(song_params)
    if @song.save
      redirect_to artist_songs_path(@artist)
    else
      render :new
    end
  end

  def edit
    @song = Song.find_by(params[:id])
    @artist = Artist.create!
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)

    if @song.save
      redirect_to artist_song_path(@artist,@song)
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

