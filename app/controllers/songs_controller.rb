class SongsController < ApplicationController
  def index
   
    if params[:artist_id] && Artist.where(id: params[:artist_id]).exists?(conditions = :none)
      @songs = Artist.find(params[:artist_id]).songs
    elsif !params[:artist_id]
      @songs = Song.all
    else
      # @artists = Artist.all
      flash[:alert] =  "Artist not found."
      redirect_to artists_path
    end
  end

  def show
    
     if params[:artist_id] && Artist.where(id: params[:artist_id]).exists?(conditions = :none) && Song.where(id: params[:id]).exists?(conditions = :none) && Song.find(params[:id]).artist.id == params[:artist_id].to_i 
      @artist = Artist.find(params[:artist_id])
      @song = Song.find(params[:id])
    elsif !params[:artist_id] && Song.where(id: params[:id]).exists?(conditions = :none)
      @song = Song.find(params[:id])
    else
     
      flash[:alert] =  "Song not found."
      redirect_to artist_songs_path(params[:artist_id])
      # redirect_to artists_path
    end

    # @song = Song.find(params[:id])
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

