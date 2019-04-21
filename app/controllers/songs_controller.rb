class SongsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_to_artists


  def index
    if params[:artist_id]
      @songs = Artist.find(params[:artist_id]).songs
    else
      @songs = Song.all
    end
  end

  def show
    @song = Song.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      redirect_to artist_songs_path
      flash[:alert] = "Song not found."
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

  def redirect_to_artists
    redirect_to artists_path
    flash[:alert] = "Artist not found."
  end


end

